'use client'

import { useEffect, useState } from 'react'
import { StudyItem } from '@/types/notes'
import { createClient } from '@/lib/supabase/client'
import { StudyItemRow } from '@/components/StudyItemRow'
import { NotesManager } from '@/components/NotesManager'
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
} from '@/components/ui/dialog'
import { Loader2, BookOpen, GraduationCap } from 'lucide-react'

import { ChevronDown, ChevronUp } from 'lucide-react'

export function NotesSection() {
  const [items, setItems] = useState<StudyItem[]>([])
  const [loading, setLoading] = useState(true)
  const [activeTab, setActiveTab] = useState<'paper' | 'course'>('paper')
  const [selectedItem, setSelectedItem] = useState<StudyItem | null>(null)
  const [isDialogOpen, setIsDialogOpen] = useState(false)
  const [isExpanded, setIsExpanded] = useState(true)
  const supabase = createClient()

  useEffect(() => {
    fetchItems()
  }, [])

  // ... (keep fetchItems and handleToggleComplete)

  const fetchItems = async () => {
    try {
      const { data, error } = await supabase
        .from('study_items')
        .select('*')
        .order('sort_order', { ascending: true })

      if (error) throw error
      setItems(data || [])
    } catch (error) {
      console.error('Error fetching items:', error)
    } finally {
      setLoading(false)
    }
  }

  const handleToggleComplete = async (item: StudyItem) => {
    // Optimistic update
    const updatedItem = { ...item, completed: !item.completed }
    setItems((prev) => prev.map((i) => (i.id === item.id ? updatedItem : i)))

    try {
      const { error } = await supabase
        .from('study_items')
        .update({ completed: !item.completed })
        .eq('id', item.id)

      if (error) throw error
    } catch (error) {
      console.error('Error updating item:', error)
      // Revert on error
      setItems((prev) => prev.map((i) => (i.id === item.id ? item : i)))
    }
  }

  const paperItems = items.filter((i) => i.type === 'paper')
  const courseItems = items.filter((i) => i.type === 'course')
  const activeItems = activeTab === 'paper' ? paperItems : courseItems

  const completedPapers = paperItems.filter((i) => i.completed).length
  const completedCourses = courseItems.filter((i) => i.completed).length

  if (loading) {
    return (
      <div className="bg-slate-900/50 rounded-2xl p-8 border border-purple-500/10 flex justify-center">
        <Loader2 className="w-6 h-6 animate-spin text-purple-500" />
      </div>
    )
  }

  return (
    <div className="bg-gradient-to-br from-slate-900 via-purple-900/10 to-slate-900 rounded-2xl shadow-2xl p-6 md:p-8 border border-purple-500/20 backdrop-blur-xl transition-all duration-300">
      {/* Header */}
      <div 
        className="flex items-center justify-between cursor-pointer group"
        onClick={() => setIsExpanded(!isExpanded)}
      >
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-purple-500 to-blue-500 flex items-center justify-center shadow-lg shadow-purple-500/20 group-hover:scale-105 transition-transform">
            <BookOpen className="w-5 h-5 text-white" />
          </div>
          <div>
            <h2 className="text-2xl md:text-3xl font-bold bg-gradient-to-r from-blue-400 via-purple-400 to-pink-400 bg-clip-text text-transparent group-hover:opacity-80 transition-opacity">
              Study Notes
            </h2>
            <p className="text-slate-400 text-sm">
              Track your reading progress and manage your notes
            </p>
          </div>
        </div>
        <button 
          className="p-2 rounded-full hover:bg-slate-800/50 text-slate-400 hover:text-white transition-colors"
        >
          {isExpanded ? <ChevronUp className="w-6 h-6" /> : <ChevronDown className="w-6 h-6" />}
        </button>
      </div>

      {isExpanded && (
        <div className="mt-8 animate-in fade-in slide-in-from-top-4 duration-300">
          {/* Tabs */}
          <div className="flex space-x-2 mb-6 bg-slate-800/50 p-1 rounded-xl w-fit border border-slate-700/50">
            <button
              onClick={() => setActiveTab('paper')}
              className={`
                px-4 py-2 text-sm font-medium rounded-lg transition-all flex items-center gap-2
                ${activeTab === 'paper'
                  ? 'bg-slate-700 text-white shadow-sm'
                  : 'text-slate-400 hover:text-slate-200 hover:bg-slate-700/50'}
              `}
            >
              <BookOpen className="w-4 h-4" />
              Papers
              <span className="ml-1.5 text-xs bg-slate-900/50 px-2 py-0.5 rounded-full text-slate-300">
                {completedPapers}/{paperItems.length}
              </span>
            </button>
            <button
              onClick={() => setActiveTab('course')}
              className={`
                px-4 py-2 text-sm font-medium rounded-lg transition-all flex items-center gap-2
                ${activeTab === 'course'
                  ? 'bg-slate-700 text-white shadow-sm'
                  : 'text-slate-400 hover:text-slate-200 hover:bg-slate-700/50'}
              `}
            >
              <GraduationCap className="w-4 h-4" />
              Courses
              <span className="ml-1.5 text-xs bg-slate-900/50 px-2 py-0.5 rounded-full text-slate-300">
                {completedCourses}/{courseItems.length}
              </span>
            </button>
          </div>

          {/* Progress Bar */}
          {activeItems.length > 0 && (
            <div className="mb-6">
              <div className="flex justify-between text-xs text-slate-400 mb-2">
                <span>Overall Progress</span>
                <span>{Math.round((activeItems.filter(i => i.completed).length / activeItems.length) * 100)}%</span>
              </div>
              <div className="h-1.5 w-full bg-slate-800 rounded-full overflow-hidden">
                <div 
                  className="h-full bg-gradient-to-r from-purple-500 to-blue-500 transition-all duration-500"
                  style={{ width: `${(activeItems.filter(i => i.completed).length / activeItems.length) * 100}%` }}
                />
              </div>
            </div>
          )}

          {/* List */}
          <div className="space-y-3">
            {activeItems.map((item, index) => (
              <StudyItemRow
                key={item.id}
                item={item}
                index={index}
                onToggleComplete={() => handleToggleComplete(item)}
                onOpenNotes={() => {
                  setSelectedItem(item)
                  setIsDialogOpen(true)
                }}
              />
            ))}

            {activeItems.length === 0 && (
              <div className="text-center py-12 text-slate-500">
                <p>No items found.</p>
              </div>
            )}
          </div>
        </div>
      )}

      {/* Notes Modal - Outside conditional rendering to ensure it doesn't unmount abruptly if expanded toggles (though impossible) */}
      <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
        {/* ... (dialog content same as before) */}
        <DialogContent className="sm:max-w-[600px] bg-slate-900 border-purple-500/20 text-slate-200">
          <DialogHeader>
            <DialogTitle className="text-xl font-bold bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent">
              {selectedItem?.title}
            </DialogTitle>
            <DialogDescription className="text-slate-400">
              {selectedItem?.author} • {selectedItem?.year}
            </DialogDescription>
          </DialogHeader>
          
          <div className="mt-4">
            {selectedItem && (
              <NotesManager 
                itemId={selectedItem.id} 
                itemTitle={selectedItem.title} 
              />
            )}
          </div>
        </DialogContent>
      </Dialog>
    </div>
  )
}
