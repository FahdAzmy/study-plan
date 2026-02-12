'use client'

import { StudyItem } from '@/types/notes'
import { Checkbox } from '@/components/ui/checkbox'
import { Button } from '@/components/ui/button'
import { FileText, CheckCircle2, Circle } from 'lucide-react'

interface StudyItemRowProps {
  item: StudyItem
  index: number
  onToggleComplete: (item: StudyItem) => void
  onOpenNotes: (item: StudyItem) => void
}

export function StudyItemRow({ item, index, onToggleComplete, onOpenNotes }: StudyItemRowProps) {
  return (
    <div
      className={`
        group relative flex items-center gap-4 p-4 rounded-xl border transition-all duration-300
        ${
          item.completed
            ? 'bg-slate-800/20 border-slate-700/30'
            : 'bg-gradient-to-r from-slate-800/40 to-slate-800/20 border-slate-700/40 hover:border-purple-500/40 hover:shadow-lg hover:shadow-purple-500/5'
        }
      `}
      style={{ animationDelay: `${index * 50}ms` }}
    >
      {/* Index number or Check Icon */}
      <span className={`
        text-xs font-bold w-6 h-6 rounded-lg flex items-center justify-center flex-shrink-0 transition-colors
        ${item.completed 
          ? 'bg-green-500/10 text-green-500 border border-green-500/20' 
          : 'bg-purple-500/10 text-purple-400 border border-purple-500/20'}
      `}>
        {item.completed ? <CheckCircle2 className="w-3.5 h-3.5" /> : index + 1}
      </span>

      {/* Checkbox (Custom Button implementation) */}
      <button
        onClick={(e) => {
          e.stopPropagation()
          onToggleComplete(item)
        }}
        className={`
          w-5 h-5 rounded-md border-2 flex items-center justify-center flex-shrink-0
          transition-all duration-200 active:scale-90
          ${
            item.completed
              ? 'bg-gradient-to-br from-green-500 to-emerald-600 border-green-400 shadow-lg shadow-green-500/30'
              : 'border-slate-500/50 hover:border-purple-400/70 hover:shadow-md hover:shadow-purple-500/10'
          }
        `}
        title={item.completed ? "Mark as incomplete" : "Mark as complete"}
      >
        {item.completed && (
          <svg className="w-3 h-3 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={3} d="M5 13l4 4L19 7" />
          </svg>
        )}
      </button>

      {/* Content */}
      <div className="flex-1 min-w-0" onClick={() => onOpenNotes(item)}> {/* Clicking row opens notes too */}
        <p
          className={`
            text-sm font-semibold leading-snug transition-all duration-200 cursor-pointer
            ${item.completed ? 'line-through text-slate-500' : 'text-slate-200 group-hover:text-white'}
          `}
        >
          {item.title}
        </p>
        <p className={`text-xs mt-0.5 ${item.completed ? 'text-slate-600' : 'text-slate-400'}`}>
          {item.author}{item.year ? `, ${item.year}` : ''}
        </p>
      </div>

      {/* Notes Button */}
      <Button
        variant={item.completed ? "ghost" : "secondary"}
        size="sm"
        onClick={(e) => {
          e.stopPropagation()
          onOpenNotes(item)
        }}
        className={`
          h-8 px-3 text-xs font-medium transition-all
          ${item.completed 
             ? 'text-slate-500 hover:text-slate-300' 
             : 'bg-slate-700/50 hover:bg-purple-500/20 text-slate-300 hover:text-purple-300 border border-slate-600/50 hover:border-purple-500/30'}
        `}
      >
        <FileText className="w-3.5 h-3.5 mr-1.5" />
        Notes
      </Button>
    </div>
  )
}
