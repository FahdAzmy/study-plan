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

  // ... existing calculation logic ...

  return (
    <div className="relative overflow-hidden glass-card rounded-3xl p-8 md:p-12 border border-white/10 group">
      {/* Background Glows */}
      <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-purple-600/20 rounded-full blur-[128px] -translate-y-1/2 translate-x-1/2 pointer-events-none" />
      <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-blue-600/10 rounded-full blur-[96px] translate-y-1/2 -translate-x-1/2 pointer-events-none" />
      
      <div className="relative z-10 flex flex-col md:flex-row items-center justify-between gap-12">
        
        {/* Left: Text & Key Metrics */}
        <div className="flex-1 space-y-8 text-center md:text-left">
          <div>
            <h2 className="text-4xl md:text-5xl font-black text-transparent bg-clip-text bg-gradient-to-r from-white via-slate-200 to-slate-400 tracking-tight drop-shadow-lg">
              Mission Status
            </h2>
            <p className="text-blue-200/60 font-mono text-sm tracking-widest uppercase mt-2">
              Deep Learning Trajectory • Phase 1
            </p>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div className="glass-panel p-4 rounded-2xl flex flex-col items-center md:items-start border border-white/5 hover:border-purple-500/30 transition-colors duration-500">
              <span className="text-xs font-mono text-purple-300/50 uppercase">Tasks Completed</span>
              <span className="text-3xl font-bold text-white mt-1">{completedTasks} <span className="text-sm text-slate-500 font-normal">/ {totalTasks}</span></span>
            </div>
            <div className="glass-panel p-4 rounded-2xl flex flex-col items-center md:items-start border border-white/5 hover:border-blue-500/30 transition-colors duration-500">
              <span className="text-xs font-mono text-blue-300/50 uppercase">Hours Logged</span>
              <span className="text-3xl font-bold text-white mt-1">{completedHours.toFixed(1)}h <span className="text-sm text-slate-500 font-normal">/ {totalHours.toFixed(0)}h</span></span>
            </div>
          </div>
        </div>

        {/* Center: The "Core" (Circular HUD) */}
        <div className="relative w-64 h-64 md:w-80 md:h-80 flex-shrink-0 flex items-center justify-center">
          {/* Outer Rotating Ring (Decorative) */}
          <div className="absolute inset-0 rounded-full border border-dashed border-white/10 animate-[spin_12s_linear_infinite]" />
          
          {/* Inner Glowing Ring (Progress) */}
          <svg className="w-full h-full -rotate-90 transform drop-shadow-[0_0_15px_rgba(168,85,247,0.4)]">
            <circle
              cx="50%"
              cy="50%"
              r="46%"
              className="stroke-slate-800/50"
              strokeWidth="12"
              fill="none"
            />
            <circle
              cx="50%"
              cy="50%"
              r="46%"
              className="stroke-purple-500 transition-all duration-1000 ease-out"
              strokeWidth="12"
              fill="none"
              strokeDasharray={2 * Math.PI * 147} // approx r=46% of 320px container
              strokeDashoffset={2 * Math.PI * 147 * (1 - overallProgress / 100)}
              strokeLinecap="round"
            />
          </svg>

          {/* Central Percent Display */}
          <div className="absolute flex flex-col items-center justify-center text-center">
            <span className="text-6xl font-black text-white tracking-tighter drop-shadow-2xl">
              {Math.round(overallProgress)}%
            </span>
            <span className="text-xs text-purple-300/70 font-mono tracking-widest mt-1 uppercase">
              Completion
            </span>
          </div>
        </div>

        {/* Right: Category "Data Stream" */}
        <div className="w-full md:w-64 space-y-3">
          <h3 className="text-xs font-mono text-slate-500 uppercase tracking-widest mb-4 border-b border-white/10 pb-2">
            Module Breakdown
          </h3>
          {Object.entries(categoryStats)
            .sort((a, b) => b[1].total - a[1].total)
            .slice(0, 5) // Show top 5
            .map(([category, stats], idx) => {
              const progress = stats.total > 0 ? (stats.completed / stats.total) * 100 : 0
              return (
                <div key={category} className="group/item flex items-center justify-between text-sm py-1">
                  <span className="text-slate-400 group-hover/item:text-white transition-colors truncate max-w-[100px]">{category}</span>
                  <div className="flex items-center gap-3">
                    <div className="w-24 h-1.5 bg-slate-800 rounded-full overflow-hidden">
                      <div 
                        className="h-full bg-slate-500 group-hover/item:bg-white transition-all duration-500 shadow-[0_0_10px_rgba(255,255,255,0.3)]"
                        style={{ width: `${progress}%` }}
                      />
                    </div>
                    <span className="font-mono text-xs text-slate-600 w-8 text-right">{Math.round(progress)}%</span>
                  </div>
                </div>
              )
            })}
        </div>

      </div>
    </div>
  )
}
