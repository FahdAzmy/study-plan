'use client'

import { useState } from 'react'
import { ChevronLeft, ChevronRight } from 'lucide-react'

interface CalendarProps {
  selectedDate: Date
  onSelectDate: (date: Date) => void
  datesWithTasks: Set<string>
}

export function Calendar({
  selectedDate,
  onSelectDate,
  datesWithTasks,
}: CalendarProps) {
  const [currentMonth, setCurrentMonth] = useState(new Date(selectedDate))

  const monthYear = currentMonth.toLocaleString('default', {
    month: 'long',
    year: 'numeric',
  })

  const firstDay = new Date(currentMonth.getFullYear(), currentMonth.getMonth(), 1)
  const lastDay = new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 0)
  const daysInMonth = lastDay.getDate()
  const startingDayOfWeek = firstDay.getDay()

  const days = []
  for (let i = 0; i < startingDayOfWeek; i++) {
    days.push(null)
  }
  for (let i = 1; i <= daysInMonth; i++) {
    days.push(i)
  }

  const weeks = []
  for (let i = 0; i < days.length; i += 7) {
    weeks.push(days.slice(i, i + 7))
  }

  const handlePrevMonth = () => {
    setCurrentMonth(
      new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1, 1)
    )
  }

  const handleNextMonth = () => {
    setCurrentMonth(
      new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 1)
    )
  }

  const handleDateClick = (day: number) => {
    const newDate = new Date(
      currentMonth.getFullYear(),
      currentMonth.getMonth(),
      day
    )
    onSelectDate(newDate)
  }

  const isSelected = (day: number) => {
    return (
      day === selectedDate.getDate() &&
      currentMonth.getMonth() === selectedDate.getMonth() &&
      currentMonth.getFullYear() === selectedDate.getFullYear()
    )
  }

  const hasTasksOnDay = (day: number) => {
    const dateStr = new Date(
      currentMonth.getFullYear(),
      currentMonth.getMonth(),
      day
    )
      .toISOString()
      .split('T')[0]
    return datesWithTasks.has(dateStr)
  }

  return (
    <div className="bg-gradient-to-br from-slate-900 to-slate-800 rounded-2xl shadow-2xl p-6 border border-slate-700/50 backdrop-blur-sm">
      <div className="flex items-center justify-between mb-6">
        <button
          onClick={handlePrevMonth}
          className="p-2.5 hover:bg-slate-700/50 rounded-lg transition duration-200 text-slate-300 hover:text-slate-100"
        >
          <ChevronLeft className="w-5 h-5" />
        </button>
        <h2 className="text-xl font-bold bg-gradient-to-r from-blue-400 to-purple-400 bg-clip-text text-transparent">{monthYear}</h2>
        <button
          onClick={handleNextMonth}
          className="p-2.5 hover:bg-slate-700/50 rounded-lg transition duration-200 text-slate-300 hover:text-slate-100"
        >
          <ChevronRight className="w-5 h-5" />
        </button>
      </div>

      <div className="grid grid-cols-7 gap-2 mb-3">
        {['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map((day) => (
          <div key={day} className="text-center font-semibold text-slate-400 py-2 text-xs uppercase tracking-wide">
            {day}
          </div>
        ))}
      </div>

      <div className="grid grid-cols-7 gap-2">
        {weeks.map((week, weekIdx) => (
          <div key={weekIdx} className="contents">
            {week.map((day, dayIdx) => (
              <button
                key={`${weekIdx}-${dayIdx}`}
                onClick={() => day && handleDateClick(day)}
                disabled={!day}
                className={`
                  relative p-3 rounded-lg text-sm font-semibold transition duration-200 h-12 flex items-center justify-center
                  ${
                    !day
                      ? 'text-slate-700 cursor-default'
                      : isSelected(day)
                        ? 'bg-gradient-to-br from-blue-500 to-purple-600 text-white shadow-lg shadow-purple-500/30 scale-105'
                        : hasTasksOnDay(day)
                          ? 'text-slate-200 bg-slate-700/60 hover:bg-slate-600/80 border border-slate-600/50 hover:border-slate-500'
                          : 'text-slate-300 hover:bg-slate-700/40 hover:text-slate-100'
                  }
                `}
              >
                {day}
                {day && hasTasksOnDay(day) && !isSelected(day) && (
                  <div className="absolute bottom-2 left-1/2 transform -translate-x-1/2 w-1.5 h-1.5 bg-gradient-to-r from-blue-400 to-purple-400 rounded-full shadow-lg" />
                )}
              </button>
            ))}
          </div>
        ))}
      </div>
    </div>
  )
}
