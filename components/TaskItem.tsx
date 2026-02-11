'use client'

import { Task } from '@/types/tasks'
import { Checkbox } from '@/components/ui/checkbox'
import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'

interface TaskItemProps {
  task: Task
  onTaskUpdate: (updatedTask: Task) => void
}

const categoryColors: Record<string, { bg: string; text: string; border: string; dot: string }> = {
  Paper: { bg: 'bg-purple-900/30', text: 'text-purple-300', border: 'border-purple-500/50', dot: 'bg-purple-500' },
  Course: { bg: 'bg-blue-900/30', text: 'text-blue-300', border: 'border-blue-500/50', dot: 'bg-blue-500' },
  RAG: { bg: 'bg-emerald-900/30', text: 'text-emerald-300', border: 'border-emerald-500/50', dot: 'bg-emerald-500' },
  Agents: { bg: 'bg-orange-900/30', text: 'text-orange-300', border: 'border-orange-500/50', dot: 'bg-orange-500' },
  Review: { bg: 'bg-amber-900/30', text: 'text-amber-300', border: 'border-amber-500/50', dot: 'bg-amber-500' },
  Activity: { bg: 'bg-rose-900/30', text: 'text-rose-300', border: 'border-rose-500/50', dot: 'bg-rose-500' },
  Break: { bg: 'bg-slate-900/30', text: 'text-slate-300', border: 'border-slate-500/50', dot: 'bg-slate-500' },
  Integration: { bg: 'bg-indigo-900/30', text: 'text-indigo-300', border: 'border-indigo-500/50', dot: 'bg-indigo-500' },
  DeepDive: { bg: 'bg-cyan-900/30', text: 'text-cyan-300', border: 'border-cyan-500/50', dot: 'bg-cyan-500' },
  FinalReview: { bg: 'bg-pink-900/30', text: 'text-pink-300', border: 'border-pink-500/50', dot: 'bg-pink-500' },
  FinalSynthesis: { bg: 'bg-violet-900/30', text: 'text-violet-300', border: 'border-violet-500/50', dot: 'bg-violet-500' },
  Completion: { bg: 'bg-green-900/30', text: 'text-green-300', border: 'border-green-500/50', dot: 'bg-green-500' },
}

export function TaskItem({ task, onTaskUpdate }: TaskItemProps) {
  const [isUpdating, setIsUpdating] = useState(false)
  const supabase = createClient()

  const handleToggleComplete = async () => {
    setIsUpdating(true)
    try {
      const { data, error } = await supabase
        .from('tasks')
        .update({ completed: !task.completed })
        .eq('id', task.id)
        .select()

      if (error) throw error

      if (data && data[0]) {
        onTaskUpdate(data[0])
      }
    } catch (error) {
      console.error('Error updating task:', error)
    } finally {
      setIsUpdating(false)
    }
  }

  const colors = categoryColors[task.category] || categoryColors['Break']

  return (
    <div
      className={`
        flex items-start gap-3 p-4 rounded-xl border transition duration-200 backdrop-blur-sm cursor-pointer
        ${
          task.completed
            ? 'bg-slate-800/30 border-slate-700/50'
            : `${colors.bg} ${colors.border} hover:${colors.bg} hover:border-slate-600/75 hover:shadow-lg hover:shadow-${colors.dot}/20`
        }
      `}
      onClick={handleToggleComplete}
      role="button"
      tabIndex={0}
      onKeyDown={(e) => {
        if (e.key === 'Enter' || e.key === ' ') {
          handleToggleComplete()
        }
      }}
    >
      <div className="flex-shrink-0 mt-0.5">
        <button
          onClick={(e) => {
            e.stopPropagation()
            handleToggleComplete()
          }}
          disabled={isUpdating}
          className={`w-5 h-5 rounded-md border-2 flex items-center justify-center transition active:scale-90 ${
            task.completed 
              ? 'bg-gradient-to-br from-green-500 to-emerald-600 border-green-400' 
              : colors.border + ' border hover:border-opacity-100'
          }`}
        >
          {task.completed && (
            <svg className="w-3 h-3 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={3} d="M5 13l4 4L19 7" />
            </svg>
          )}
        </button>
      </div>
      <div className="flex-1 min-w-0">
        <div className="flex items-start justify-between gap-2">
          <p
            className={`
              text-sm font-semibold break-words transition
              ${task.completed ? 'line-through text-slate-500' : colors.text}
            `}
          >
            {task.title}
          </p>
          <span className={`${colors.bg} ${colors.text} text-xs font-bold px-2.5 py-1 rounded-lg whitespace-nowrap border ${colors.border} flex items-center gap-1.5`}>
            <span className={`w-1.5 h-1.5 rounded-full ${colors.dot}`} />
            {task.category}
          </span>
        </div>
        <p className="text-xs text-slate-400 mt-2">
          ⏱ {task.estimated_hours.toFixed(1)}h
        </p>
      </div>
    </div>
  )
}
