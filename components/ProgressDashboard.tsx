'use client'

import { Task } from '@/types/tasks'

interface ProgressDashboardProps {
  tasks: Task[]
}

export function ProgressDashboard({ tasks }: ProgressDashboardProps) {
  const totalTasks = tasks.length
  const completedTasks = tasks.filter((task) => task.completed).length
  const totalHours = tasks.reduce((sum, task) => sum + task.estimated_hours, 0)
  const completedHours = tasks
    .filter((task) => task.completed)
    .reduce((sum, task) => sum + task.estimated_hours, 0)

  const overallProgress = totalTasks > 0 ? (completedTasks / totalTasks) * 100 : 0
  const hoursProgress = totalHours > 0 ? (completedHours / totalHours) * 100 : 0

  // Calculate category breakdown
  const categoryStats = tasks.reduce(
    (acc, task) => {
      if (!acc[task.category]) {
        acc[task.category] = { total: 0, completed: 0 }
      }
      acc[task.category].total += 1
      if (task.completed) {
        acc[task.category].completed += 1
      }
      return acc
    },
    {} as Record<string, { total: number; completed: number }>
  )

  return (
    <div className="bg-gradient-to-br from-slate-900 via-purple-900 to-slate-900 rounded-2xl shadow-2xl p-8 border border-purple-500/20">
      <div className="mb-8">
        <h2 className="text-3xl font-bold bg-gradient-to-r from-blue-400 via-purple-400 to-pink-400 bg-clip-text text-transparent">
          Study Progress
        </h2>
        <p className="text-purple-200/60 text-sm mt-1">Track your journey through the LLM study plan</p>
      </div>

      {/* Main progress cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
        {/* Tasks progress */}
        <div className="bg-gradient-to-br from-blue-900/40 to-blue-800/20 rounded-xl p-6 border border-blue-500/30 backdrop-blur-sm hover:border-blue-500/50 transition">
          <div className="flex items-end justify-between mb-4">
            <span className="text-sm font-semibold text-blue-300">Tasks Completed</span>
            <span className="text-4xl font-bold bg-gradient-to-r from-blue-400 to-cyan-400 bg-clip-text text-transparent">
              {Math.round(overallProgress)}%
            </span>
          </div>
          <div className="w-full bg-blue-900/30 rounded-full h-3 border border-blue-500/20">
            <div
              className="bg-gradient-to-r from-blue-500 via-cyan-500 to-blue-400 h-3 rounded-full transition-all duration-500 shadow-lg shadow-blue-500/50"
              style={{ width: `${overallProgress}%` }}
            />
          </div>
          <p className="text-xs text-blue-300/80 mt-3">
            <span className="font-semibold">{completedTasks}</span> of <span className="font-semibold">{totalTasks}</span> tasks
          </p>
        </div>

        {/* Hours progress */}
        <div className="bg-gradient-to-br from-purple-900/40 to-purple-800/20 rounded-xl p-6 border border-purple-500/30 backdrop-blur-sm hover:border-purple-500/50 transition">
          <div className="flex items-end justify-between mb-4">
            <span className="text-sm font-semibold text-purple-300">Hours Completed</span>
            <span className="text-4xl font-bold bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent">
              {Math.round(hoursProgress)}%
            </span>
          </div>
          <div className="w-full bg-purple-900/30 rounded-full h-3 border border-purple-500/20">
            <div
              className="bg-gradient-to-r from-purple-500 via-pink-500 to-purple-400 h-3 rounded-full transition-all duration-500 shadow-lg shadow-purple-500/50"
              style={{ width: `${hoursProgress}%` }}
            />
          </div>
          <p className="text-xs text-purple-300/80 mt-3">
            <span className="font-semibold">{completedHours.toFixed(1)}h</span> of <span className="font-semibold">{totalHours.toFixed(1)}h</span>
          </p>
        </div>
      </div>

      {/* Category breakdown */}
      <div className="bg-gradient-to-br from-slate-800/50 to-slate-900/50 rounded-xl p-6 border border-slate-700/50 backdrop-blur-sm">
        <h3 className="font-semibold text-slate-100 mb-5 text-sm uppercase tracking-wider">Progress by Category</h3>
        <div className="space-y-4">
          {Object.entries(categoryStats)
            .sort((a, b) => b[1].total - a[1].total)
            .map(([category, stats], idx) => {
              const progress = stats.total > 0 ? (stats.completed / stats.total) * 100 : 0
              const colors = [
                'from-blue-500 to-cyan-500',
                'from-purple-500 to-pink-500',
                'from-emerald-500 to-teal-500',
                'from-orange-500 to-yellow-500',
                'from-rose-500 to-pink-500',
                'from-indigo-500 to-purple-500',
              ]
              const colorClass = colors[idx % colors.length]
              return (
                <div key={category} className="group">
                  <div className="flex items-center justify-between mb-2">
                    <span className="text-sm font-medium text-slate-300 group-hover:text-slate-100 transition">{category}</span>
                    <span className="text-xs font-semibold text-slate-400">
                      {stats.completed}/{stats.total}
                    </span>
                  </div>
                  <div className="w-full bg-slate-700/50 rounded-full h-2.5 overflow-hidden border border-slate-600/50">
                    <div
                      className={`bg-gradient-to-r ${colorClass} h-2.5 rounded-full transition-all duration-500 shadow-lg`}
                      style={{ width: `${progress}%` }}
                    />
                  </div>
                </div>
              )
            })}
        </div>
      </div>
    </div>
  )
}
