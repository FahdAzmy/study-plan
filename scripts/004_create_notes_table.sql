-- Create study_notes table for papers and courses
CREATE TABLE IF NOT EXISTS public.study_notes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  author TEXT,
  year TEXT,
  type TEXT NOT NULL CHECK (type IN ('paper', 'course')),
  completed BOOLEAN DEFAULT FALSE,
  notes TEXT DEFAULT '',
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Enable RLS
ALTER TABLE public.study_notes ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Allow all to read study_notes" ON public.study_notes
  FOR SELECT USING (TRUE);

CREATE POLICY "Allow all to insert study_notes" ON public.study_notes
  FOR INSERT WITH CHECK (TRUE);

CREATE POLICY "Allow all to update study_notes" ON public.study_notes
  FOR UPDATE USING (TRUE);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_study_notes_type ON public.study_notes(type);
CREATE INDEX IF NOT EXISTS idx_study_notes_completed ON public.study_notes(completed);
CREATE INDEX IF NOT EXISTS idx_study_notes_sort_order ON public.study_notes(sort_order);
