export interface Task {
  id: string
  title: string
  description?: string
  task_date: string
  category: string
  estimated_hours: number
  completed: boolean
  created_at: string
  updated_at: string
}
