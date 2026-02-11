-- Create tasks table
CREATE TABLE IF NOT EXISTS public.tasks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  description TEXT,
  task_date DATE NOT NULL,
  category TEXT NOT NULL,
  estimated_hours DECIMAL(5, 2),
  completed BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Enable RLS
ALTER TABLE public.tasks ENABLE ROW LEVEL SECURITY;

-- Create policy to allow all to read tasks (public view)
CREATE POLICY "Allow all to read tasks" ON public.tasks
  FOR SELECT USING (TRUE);

-- Create policy to allow all to insert tasks
CREATE POLICY "Allow all to insert tasks" ON public.tasks
  FOR INSERT WITH CHECK (TRUE);

-- Create policy to allow all to update tasks
CREATE POLICY "Allow all to update tasks" ON public.tasks
  FOR UPDATE USING (TRUE);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_tasks_date ON public.tasks(task_date);
CREATE INDEX IF NOT EXISTS idx_tasks_completed ON public.tasks(completed);
