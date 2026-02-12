export interface StudyItem {
  id: string
  title: string
  author?: string
  year?: string
  type: 'paper' | 'course'
  completed: boolean
  sort_order: number
  created_at: string
}

export interface ItemNote {
  id: string
  item_id: string
  content: string
  created_at: string
  updated_at: string
}
