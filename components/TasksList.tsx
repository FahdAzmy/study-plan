'use client'

import { Task } from '@/types/tasks'
import { TaskItem } from './TaskItem'

interface TasksListProps {
  tasks: Task[]
  selectedDate: Date
  onTaskUpdate: (updatedTask: Task) => void
}

export function TasksList({
  tasks,
  selectedDate,
  onTaskUpdate,
}: TasksListProps) {
  const dateStr = selectedDate.toISOString().split('T')[0]
  const dayTasks = tasks.filter((task) => task.task_date === dateStr)

  const completedCount = dayTasks.filter((task) => task.completed).length
  const totalHours = dayTasks.reduce((sum, task) => sum + task.estimated_hours, 0)
  const completedHours = dayTasks
    .filter((task) => task.completed)
    .reduce((sum, task) => sum + task.estimated_hours, 0)

  const formattedDate = selectedDate.toLocaleDateString('default', {
    weekday: 'long',
    month: 'long',
    day: 'numeric',
  })

  return (
    <div className="bg-gradient-to-br from-slate-900 to-slate-800 rounded-2xl shadow-2xl p-8 border border-slate-700/50 backdrop-blur-sm">
      <div className="mb-8">
        <h2 className="text-3xl font-bold bg-gradient-to-r from-blue-400 via-purple-400 to-pink-400 bg-clip-text text-transparent mb-1">
          {formattedDate}
        </h2>
        <p className="text-slate-400 text-sm">
          {dayTasks.length === 0 ? 'No tasks scheduled' : `${dayTasks.length} task${dayTasks.length !== 1 ? 's' : ''} today`}
        </p>

        {/* Stats and Progress */}
        {dayTasks.length > 0 && (
          <div className="mt-6 grid grid-cols-2 gap-4 mb-6">
            <div className="bg-blue-900/20 rounded-lg p-3 border border-blue-500/30">
              <p className="text-xs text-blue-300/60 uppercase tracking-wide font-semibold">Tasks</p>
              <p className="text-2xl font-bold text-blue-300 mt-1">{completedCount}/{dayTasks.length}</p>
            </div>
            <div className="bg-purple-900/20 rounded-lg p-3 border border-purple-500/30">
              <p className="text-xs text-purple-300/60 uppercase tracking-wide font-semibold">Hours</p>
              <p className="text-2xl font-bold text-purple-300 mt-1">{completedHours.toFixed(1)}/{totalHours.toFixed(1)}</p>
            </div>
          </div>
        )}

        {/* Progress bar */}
        {dayTasks.length > 0 && (
          <div className="w-full bg-slate-700/50 rounded-full h-3 overflow-hidden border border-slate-600/50">
            <div
              className="bg-gradient-to-r from-emerald-500 via-green-500 to-emerald-400 h-3 rounded-full transition-all duration-500 shadow-lg shadow-emerald-500/50"
              style={{
                width: `${dayTasks.length > 0 ? (completedCount / dayTasks.length) * 100 : 0}%`,
              }}
            />
          </div>
        )}
      </div>

      {dayTasks.length === 0 ? (
        <div className="text-center py-12">
          <div className="inline-block mb-3">
            <div className="text-5xl">📅</div>
          </div>
          <p className="text-slate-400 font-medium">No tasks for this day</p>
          <p className="text-slate-500 text-sm mt-1">Pick another day to view tasks</p>
        </div>
      ) : (
        <div className="space-y-3">
          {dayTasks.map((task) => (
            <TaskItem key={task.id} task={task} onTaskUpdate={onTaskUpdate} />
          ))}
        </div>
      )}
    </div>
  )
}
