-- Drop previous table if exists (cleaning up previous attempt)
DROP TABLE IF EXISTS public.study_notes;

-- Create study_items table (The Papers/Courses themselves)
CREATE TABLE IF NOT EXISTS public.study_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  author TEXT,
  year TEXT,
  type TEXT NOT NULL CHECK (type IN ('paper', 'course')),
  completed BOOLEAN DEFAULT FALSE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create item_notes table (The notes linked to items)
CREATE TABLE IF NOT EXISTS public.item_notes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  item_id UUID REFERENCES public.study_items(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Enable RLS
ALTER TABLE public.study_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.item_notes ENABLE ROW LEVEL SECURITY;

-- Policies for study_items
CREATE POLICY "Allow all to read study_items" ON public.study_items FOR SELECT USING (TRUE);
CREATE POLICY "Allow all to insert study_items" ON public.study_items FOR INSERT WITH CHECK (TRUE);
CREATE POLICY "Allow all to update study_items" ON public.study_items FOR UPDATE USING (TRUE);
CREATE POLICY "Allow all to delete study_items" ON public.study_items FOR DELETE USING (TRUE);

-- Policies for item_notes
CREATE POLICY "Allow all to read item_notes" ON public.item_notes FOR SELECT USING (TRUE);
CREATE POLICY "Allow all to insert item_notes" ON public.item_notes FOR INSERT WITH CHECK (TRUE);
CREATE POLICY "Allow all to update item_notes" ON public.item_notes FOR UPDATE USING (TRUE);
CREATE POLICY "Allow all to delete item_notes" ON public.item_notes FOR DELETE USING (TRUE);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_study_items_type ON public.study_items(type);
CREATE INDEX IF NOT EXISTS idx_item_notes_item_id ON public.item_notes(item_id);
