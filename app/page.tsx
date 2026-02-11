'use client'

import { useEffect, useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { Task } from '@/types/tasks'
import { Calendar } from '@/components/Calendar'
import { TasksList } from '@/components/TasksList'
import { ProgressDashboard } from '@/components/ProgressDashboard'

export default function Home() {
  const [tasks, setTasks] = useState<Task[]>([])
  const [selectedDate, setSelectedDate] = useState(new Date())
  const [loading, setLoading] = useState(true)
  const supabase = createClient()

  useEffect(() => {
    async function fetchTasks() {
      try {
        const { data, error } = await supabase.from('tasks').select('*')

        if (error) throw error

        setTasks(data || [])
      } catch (error) {
        console.error('Error fetching tasks:', error)
      } finally {
        setLoading(false)
      }
    }

    fetchTasks()
  }, [])

  const handleTaskUpdate = (updatedTask: Task) => {
    setTasks((prevTasks) =>
      prevTasks.map((task) => (task.id === updatedTask.id ? updatedTask : task))
    )
  }

  const datesWithTasks = new Set(
    tasks
      .filter((task) => !task.completed)
      .map((task) => task.task_date)
  )

  if (loading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-slate-950 via-purple-900 to-slate-950 flex items-center justify-center">
        <div className="text-center">
          <div className="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-purple-500"></div>
          <p className="mt-4 text-purple-300 font-medium">Loading your study plan...</p>
        </div>
      </div>
    )
  }

  return (
    <main className="min-h-screen bg-gradient-to-br from-slate-950 via-purple-900 to-slate-950 py-8 px-4">
      {/* Animated background elements */}
      <div className="fixed inset-0 overflow-hidden pointer-events-none">
        <div className="absolute top-0 right-0 w-96 h-96 bg-purple-500/10 rounded-full blur-3xl animate-pulse" />
        <div className="absolute bottom-0 left-0 w-96 h-96 bg-blue-500/10 rounded-full blur-3xl animate-pulse" />
      </div>

      <div className="max-w-7xl mx-auto relative z-10">
        {/* Header */}
        <div className="mb-12 text-center">
          <h1 className="text-5xl md:text-6xl font-bold bg-gradient-to-r from-blue-400 via-purple-400 to-pink-400 bg-clip-text text-transparent mb-3">
            LLM Study Tracker
          </h1>
          <p className="text-slate-300 text-lg font-light">
            Your comprehensive study journey from <span className="font-semibold text-blue-300">Feb 12</span> to <span className="font-semibold text-pink-300">Mar 31, 2026</span>
          </p>
          <div className="mt-4 flex items-center justify-center gap-2">
            <div className="h-px w-8 bg-gradient-to-r from-transparent to-purple-400" />
            <p className="text-sm text-slate-400">7 weeks • 250+ tasks • 500+ hours</p>
            <div className="h-px w-8 bg-gradient-to-l from-transparent to-purple-400" />
          </div>
        </div>

        {/* Overall Progress Dashboard */}
        <div className="mb-12">
          <ProgressDashboard tasks={tasks} />
        </div>

        {/* Main content grid */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Calendar */}
          <div className="lg:col-span-1">
            <div className="sticky top-8">
              <Calendar
                selectedDate={selectedDate}
                onSelectDate={setSelectedDate}
                datesWithTasks={datesWithTasks}
              />
            </div>
          </div>

          {/* Tasks for selected day */}
          <div className="lg:col-span-2">
            <TasksList
              tasks={tasks}
              selectedDate={selectedDate}
              onTaskUpdate={handleTaskUpdate}
            />
          </div>
        </div>
      </div>
    </main>
  )
}
