'use client'

import { useState, useEffect } from 'react'
import { createClient } from '@/lib/supabase/client'
import { ItemNote } from '@/types/notes'
import { Button } from '@/components/ui/button'
import { Textarea } from '@/components/ui/textarea'
import { ScrollArea } from '@/components/ui/scroll-area'
import { Loader2, Plus, Pencil, Trash2, X, Save, Maximize2 } from 'lucide-react'
import { formatDistanceToNow } from 'date-fns'
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
  DialogFooter,
} from '@/components/ui/dialog'

interface NotesManagerProps {
  itemId: string
  itemTitle: string
}

export function NotesManager({ itemId, itemTitle }: NotesManagerProps) {
  const [notes, setNotes] = useState<ItemNote[]>([])
  const [loading, setLoading] = useState(true)
  const [newNote, setNewNote] = useState('')
  const [isAdding, setIsAdding] = useState(false)
  const [editingNoteId, setEditingNoteId] = useState<string | null>(null)
  const [editContent, setEditContent] = useState('')
  const [expandedNote, setExpandedNote] = useState<ItemNote | null>(null)
  const [expandedContent, setExpandedContent] = useState('')
  const [savingId, setSavingId] = useState<string | null>(null) // ID of note being saved/deleted
  const supabase = createClient()

  const fetchNotes = async () => {
    try {
      const { data, error } = await supabase
        .from('item_notes')
        .select('*')
        .eq('item_id', itemId)
        .order('created_at', { ascending: false })

      if (error) throw error
      setNotes(data || [])
    } catch (error) {
      console.error('Error fetching notes:', error)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchNotes()
  }, [itemId])

  const handleAddNote = async () => {
    if (!newNote.trim()) return

    setSavingId('new')
    try {
      const { data, error } = await supabase
        .from('item_notes')
        .insert([{ item_id: itemId, content: newNote }])
        .select()
      
      if (error) throw error
      if (data) {
        setNotes([data[0], ...notes])
        setNewNote('')
        setIsAdding(false)
      }
    } catch (error) {
      console.error('Error adding note:', error)
    } finally {
      setSavingId(null)
    }
  }

  const handleUpdateNote = async (id: string, content: string) => {
    if (!content.trim()) return

    setSavingId(id)
    try {
      const { data, error } = await supabase
        .from('item_notes')
        .update({ content: content, updated_at: new Date().toISOString() })
        .eq('id', id)
        .select()

      if (error) throw error
      if (data) {
        setNotes(notes.map((n) => (n.id === id ? data[0] : n)))
        setEditingNoteId(null)
        setEditContent('')
        setExpandedNote(null)
        setExpandedContent('')
      }
    } catch (error) {
      console.error('Error updating note:', error)
    } finally {
      setSavingId(null)
    }
  }

  const handleDeleteNote = async (id: string) => {
    setSavingId(id)
    try {
      const { error } = await supabase
        .from('item_notes')
        .delete()
        .eq('id', id)

      if (error) throw error
      setNotes(notes.filter((n) => n.id !== id))
    } catch (error) {
      console.error('Error deleting note:', error)
    } finally {
      setSavingId(null)
    }
  }

  if (loading) {
    return (
      <div className="flex justify-center p-8">
        <Loader2 className="w-6 h-6 animate-spin text-purple-500" />
      </div>
    )
  }

  return (
    <div className="space-y-4">
      {/* Add New Note Section */}
      {!isAdding && (
        <Button
          onClick={() => setIsAdding(true)}
          className="w-full justify-start text-slate-400 border-slate-700/50 hover:bg-slate-800/50 hover:text-purple-400 transition-all border-dashed"
          variant="outline"
        >
          <Plus className="w-4 h-4 mr-2" />
          Add a new note...
        </Button>
      )}

      {isAdding && (
        <div className="bg-slate-800/50 rounded-lg p-3 border border-purple-500/30 space-y-3 animate-in fade-in slide-in-from-top-2 duration-200">
          <Textarea
            value={newNote}
            onChange={(e) => setNewNote(e.target.value)}
            placeholder="أكتب ملاحظاتك هنا..."
            className="min-h-[100px] border-slate-700 bg-slate-900/50 focus-visible:ring-purple-500/30 text-right"
            dir="rtl"
            autoFocus
          />
          <div className="flex justify-end gap-2">
            <Button
              variant="ghost"
              size="sm"
              onClick={() => {
                setIsAdding(false)
                setNewNote('')
              }}
              className="text-slate-400 hover:text-slate-200"
            >
              Cancel
            </Button>
            <Button
              size="sm"
              onClick={handleAddNote}
              disabled={!newNote.trim() || savingId === 'new'}
              className="bg-purple-600 hover:bg-purple-500 text-white"
            >
              {savingId === 'new' ? (
                <Loader2 className="w-4 h-4 animate-spin mr-2" />
              ) : (
                <Save className="w-4 h-4 mr-2" />
              )}
              Save Note
            </Button>
          </div>
        </div>
      )}

      {/* Notes List */}
      <ScrollArea className="h-[400px] pr-4">
        <div className="space-y-4">
          {notes.length === 0 && !isAdding && (
            <div className="text-center py-10 text-slate-500">
              <p>No notes yet.</p>
              <p className="text-sm">Click "Add a new note" to get started.</p>
            </div>
          )}

          {notes.map((note) => (
            <div
              key={note.id}
              className="group relative bg-slate-800/30 rounded-lg p-4 border border-slate-700/50 hover:border-slate-600 transition-all"
            >
              {editingNoteId === note.id ? (
                <div className="space-y-3">
                  <Textarea
                    value={editContent}
                    onChange={(e) => setEditContent(e.target.value)}
                    className="min-h-[100px] border-slate-700 bg-slate-900/50 text-right"
                    dir="rtl"
                  />
                  <div className="flex justify-end gap-2">
                    <Button
                      variant="ghost"
                      size="sm"
                      onClick={() => {
                        setEditingNoteId(null)
                        setEditContent('')
                      }}
                    >
                      Cancel
                    </Button>
                    <Button
                      size="sm"
                      onClick={() => handleUpdateNote(note.id, editContent)}
                      disabled={savingId === note.id}
                      className="bg-blue-600 hover:bg-blue-500"
                    >
                      {savingId === note.id ? (
                        <Loader2 className="w-4 h-4 animate-spin" />
                      ) : (
                        'Update'
                      )}
                    </Button>
                  </div>
                </div>
              ) : (
                <>
                  <p 
                    className="text-slate-200 text-sm whitespace-pre-wrap leading-relaxed cursor-pointer hover:text-white transition-colors text-right"
                    dir="rtl"
                    onClick={() => {
                      setExpandedNote(note)
                      setExpandedContent(note.content)
                    }}
                  >
                    {note.content}
                  </p>
                  <div className="flex items-center justify-between mt-3 border-t border-slate-700/30 pt-3">
                    <span className="text-xs text-slate-500">
                      {formatDistanceToNow(new Date(note.created_at), { addSuffix: true })}
                    </span>
                    <div className="flex gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                      <Button
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-slate-400 hover:text-purple-400 hover:bg-purple-900/20"
                        onClick={() => {
                          setExpandedNote(note)
                          setExpandedContent(note.content)
                        }}
                        title="Expand Editor"
                      >
                        <Maximize2 className="w-3.5 h-3.5" />
                        <span className="sr-only">Expand</span>
                      </Button>
                      <Button
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-slate-400 hover:text-blue-400 hover:bg-blue-900/20"
                        onClick={() => {
                          setEditingNoteId(note.id)
                          setEditContent(note.content)
                        }}
                      >
                        <Pencil className="w-3.5 h-3.5" />
                        <span className="sr-only">Edit</span>
                      </Button>
                      <Button
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-slate-400 hover:text-red-400 hover:bg-red-900/20"
                        onClick={() => handleDeleteNote(note.id)}
                        disabled={savingId === note.id}
                      >
                        {savingId === note.id ? (
                          <Loader2 className="w-3.5 h-3.5 animate-spin" />
                        ) : (
                          <Trash2 className="w-3.5 h-3.5" />
                        )}
                        <span className="sr-only">Delete</span>
                      </Button>
                    </div>
                  </div>
                </>
              )}
            </div>
          ))}
        </div>
      </ScrollArea>

      {/* Expanded Note Modal */}
      <Dialog open={!!expandedNote} onOpenChange={(open) => !open && setExpandedNote(null)}>
        <DialogContent className="max-w-3xl h-[80vh] flex flex-col bg-slate-900 border-purple-500/20">
          <DialogHeader>
            <DialogTitle className="text-xl font-bold bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent">
              Edit Note
            </DialogTitle>
            <DialogDescription>
              Expanded view for {itemTitle}
            </DialogDescription>
          </DialogHeader>
          <div className="flex-1 py-4">
            <Textarea
              value={expandedContent}
              onChange={(e) => setExpandedContent(e.target.value)}
              className="h-full resize-none text-base leading-relaxed bg-slate-800/50 border-slate-700/50 focus:border-purple-500/50 text-white placeholder:text-slate-500 text-right"
              placeholder="أكتب ملاحظاتك هنا..."
              dir="rtl"
            />
          </div>
          <DialogFooter>
            <Button
              variant="ghost"
              onClick={() => setExpandedNote(null)}
              className="text-slate-400"
            >
              Cancel
            </Button>
            <Button
              onClick={() => expandedNote && handleUpdateNote(expandedNote.id, expandedContent)}
              disabled={!expandedNote || savingId === expandedNote.id}
              className="bg-purple-600 hover:bg-purple-500 text-white min-w-[100px]"
            >
              {expandedNote && savingId === expandedNote.id ? (
                <Loader2 className="w-4 h-4 animate-spin mr-2" />
              ) : (
                <Save className="w-4 h-4 mr-2" />
              )}
              Save Changes
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  )
}
