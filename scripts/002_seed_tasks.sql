-- Seed tasks from the LLM Study Plan (Feb 12 - Mar 31, 2026)
-- This inserts all tasks into the tasks table

INSERT INTO tasks (task_date, title, category, estimated_hours, completed) VALUES
-- Week 1: Foundation Phase (Feb 12-18)
('2026-02-12', 'Read paper sections 1-3: Attention Is All You Need', 'Paper', 1.5, false),
('2026-02-12', 'Break + notes', 'Break', 0.5, false),
('2026-02-12', 'Sections 4-6 + implementation details: Attention Is All You Need', 'Paper', 1.0, false),
('2026-02-12', 'Setup: HF LLM Ch 0', 'Course', 0.5, false),
('2026-02-12', 'Introduction: HF LLM Ch 1', 'Course', 0.5, false),
('2026-02-12', 'RAG Overview: RAG Module 1', 'Course', 0.33, false),

('2026-02-13', 'Re-read complex sections + math: Attention Is All You Need', 'Paper', 1.5, false),
('2026-02-13', 'Implementation notes: Attention Is All You Need', 'Paper', 1.0, false),
('2026-02-13', 'Connect to modern variants: Attention Is All You Need', 'Paper', 0.5, false),
('2026-02-13', 'Transformers capabilities: HF LLM Ch 1', 'Course', 0.67, false),
('2026-02-13', 'Applications: RAG Module 1', 'Course', 0.33, false),

('2026-02-14', 'Visual walkthrough + understanding: The Illustrated Transformer', 'Paper', 2.0, false),
('2026-02-14', 'Compare with original paper: The Illustrated Transformer', 'Paper', 1.0, false),
('2026-02-14', 'Architecture details: HF LLM Ch 1', 'Course', 0.67, false),
('2026-02-14', 'Intro to LLMs: RAG Module 1', 'Course', 0.33, false),

('2026-02-15', 'Paper reading: BERT', 'Paper', 2.0, false),
('2026-02-15', 'Pre-training objectives: BERT', 'Paper', 1.0, false),
('2026-02-15', 'Fine-tuning strategies: BERT', 'Paper', 1.0, false),
('2026-02-15', 'Implementation insights: BERT', 'Paper', 1.0, false),
('2026-02-15', 'Using Transformers: HF LLM Ch 2', 'Course', 0.5, false),
('2026-02-15', 'Information Retrieval intro: RAG Module 2', 'Course', 0.33, false),

('2026-02-16', 'Review + notes consolidation: BERT', 'Paper', 1.0, false),
('2026-02-16', 'Main paper sections: GPT-3', 'Paper', 2.0, false),
('2026-02-16', 'Scaling experiments: GPT-3', 'Paper', 1.0, false),
('2026-02-16', 'In-context learning: GPT-3', 'Paper', 1.0, false),
('2026-02-16', 'Pipeline API: HF LLM Ch 2', 'Course', 0.5, false),
('2026-02-16', 'Choose + first listen: English Song', 'Activity', 0.25, false),

('2026-02-17', 'Analysis + comparison with BERT: GPT-3', 'Paper', 2.0, false),
('2026-02-17', 'Models and tokenizers: HF LLM Ch 2', 'Course', 1.0, false),
('2026-02-17', 'Fine-tuning intro: HF LLM Ch 3', 'Course', 1.0, false),
('2026-02-17', 'Retriever architecture: RAG Module 2', 'Course', 0.5, false),
('2026-02-17', 'Intro to agents: Agents Unit 1', 'Course', 0.33, false),

('2026-02-18', 'Review Week 1 papers', 'Review', 2.0, false),
('2026-02-18', 'Consolidate notes from courses', 'Review', 1.0, false),
('2026-02-18', 'Create concept map connecting papers', 'Review', 1.0, false),
('2026-02-18', 'Practice: English Song', 'Activity', 0.5, false),

('2026-02-19', 'Main findings + equations: Scaling Laws (Kaplan)', 'Paper', 2.0, false),
('2026-02-19', 'Experimental results: Scaling Laws (Kaplan)', 'Paper', 1.5, false),
('2026-02-19', 'Implications for training: Scaling Laws (Kaplan)', 'Paper', 1.5, false),
('2026-02-19', 'Fine-tuning: HF LLM Ch 3', 'Course', 0.5, false),
('2026-02-19', 'Search methods: RAG Module 2', 'Course', 0.33, false),

('2026-02-20', 'Optimal compute allocation: Chinchilla', 'Paper', 2.0, false),
('2026-02-20', 'Comparison with Kaplan: Chinchilla', 'Paper', 1.5, false),
('2026-02-20', 'Training methodology: Chinchilla', 'Paper', 1.5, false),
('2026-02-20', 'Sharing models: HF LLM Ch 4', 'Course', 0.5, false),
('2026-02-20', 'Vector embeddings: RAG Module 2', 'Course', 0.33, false),

('2026-02-21', 'Architecture choices: LLaMA', 'Paper', 2.0, false),
('2026-02-21', 'Training details: LLaMA', 'Paper', 1.5, false),
('2026-02-21', 'Evaluation + efficiency: LLaMA', 'Paper', 1.5, false),

('2026-02-22', 'Flash Attention concepts', 'Paper', 2.0, false),
('2026-02-22', 'Implementation details: Flash Attention', 'Paper', 1.5, false),

('2026-02-23', 'Mixture of Experts overview', 'Paper', 2.0, false),
('2026-02-23', 'Sparse architectures: Mixture of Experts', 'Paper', 1.5, false),

('2026-02-24', 'Context window expansion: RoPE', 'Paper', 1.5, false),
('2026-02-24', 'Position encoding: RoPE', 'Paper', 1.5, false),

('2026-02-25', 'Week 2 review and consolidation', 'Review', 3.0, false),
('2026-02-25', 'Practice: English Song', 'Activity', 0.5, false),

-- Week 3: Applications & Alignment (Feb 26 - Mar 4)
('2026-02-26', 'Architecture + methodology: RAG', 'Paper', 2.0, false),
('2026-02-26', 'Retrieval strategies: RAG', 'Paper', 1.0, false),
('2026-02-26', 'Generation integration: RAG', 'Paper', 1.0, false),
('2026-02-26', 'NLP tasks continued: HF LLM Ch 7', 'Course', 1.0, false),
('2026-02-26', 'Chunking strategies: RAG Module 3', 'Course', 0.5, false),
('2026-02-26', 'Framework intro: Agents Unit 2', 'Course', 0.33, false),

('2026-02-27', 'RLHF methodology: InstructGPT', 'Paper', 2.0, false),
('2026-02-27', 'Reward modeling: InstructGPT', 'Paper', 1.5, false),
('2026-02-27', 'Alignment results: InstructGPT', 'Paper', 1.5, false),
('2026-02-27', 'How to ask for help: HF LLM Ch 8', 'Course', 0.5, false),
('2026-02-27', 'Reranking: RAG Module 3', 'Course', 0.33, false),

('2026-02-28', 'Direct preference optimization: DPO', 'Paper', 2.0, false),
('2026-02-28', 'Comparison with RLHF: DPO', 'Paper', 1.5, false),
('2026-02-28', 'Implementation details: DPO', 'Paper', 1.5, false),
('2026-02-28', 'Building demos: HF LLM Ch 9', 'Course', 0.5, false),
('2026-02-28', 'LLM architecture: RAG Module 4', 'Course', 0.33, false),

('2026-03-01', 'Prompting methodology: Chain-of-Thought', 'Paper', 2.0, false),
('2026-03-01', 'Reasoning capabilities: Chain-of-Thought', 'Paper', 1.0, false),
('2026-03-01', 'Applications + examples: Chain-of-Thought', 'Paper', 1.0, false),
('2026-03-01', 'Demo sharing: HF LLM Ch 9', 'Course', 1.0, false),
('2026-03-01', 'Sampling strategies: RAG Module 4', 'Course', 0.5, false),
('2026-03-01', 'smolagents: Agents Unit 2', 'Course', 0.5, false),
('2026-03-01', 'MCP fundamentals: MCP Unit 1', 'Course', 0.33, false),

('2026-03-02', 'Reasoning + Acting paradigm: ReAct', 'Paper', 2.0, false),
('2026-03-02', 'Implementation: ReAct', 'Paper', 1.0, false),
('2026-03-02', 'Comparison with CoT: ReAct', 'Paper', 1.0, false),
('2026-03-02', 'Dataset curation: HF LLM Ch 10', 'Course', 1.0, false),
('2026-03-02', 'Prompt engineering: RAG Module 4', 'Course', 0.5, false),
('2026-03-02', 'LlamaIndex: Agents Unit 2', 'Course', 0.5, false),
('2026-03-02', 'Core concepts: MCP Unit 1', 'Course', 0.33, false),
('2026-03-02', 'Choose Week 3 song + first listen: English Song', 'Activity', 0.25, false),

('2026-03-03', 'High-quality datasets: HF LLM Ch 10', 'Course', 2.0, false),
('2026-03-03', 'Handling hallucinations: RAG Module 4', 'Course', 1.0, false),
('2026-03-03', 'LLM evaluation: RAG Module 4', 'Course', 1.0, false),
('2026-03-03', 'LangGraph: Agents Unit 2', 'Course', 1.0, false),
('2026-03-03', 'Use cases: MCP Unit 1', 'Course', 0.5, false),

('2026-03-04', 'Review Week 3 papers', 'Review', 2.0, false),
('2026-03-04', 'RAG + Alignment synthesis', 'Review', 1.0, false),
('2026-03-04', 'Reasoning methods comparison', 'Review', 1.0, false),
('2026-03-04', 'Practice: English Song', 'Activity', 0.5, false),

-- Week 4: Advanced MoE & Modern Models (Mar 5-11)
('2026-03-05', 'MoE architecture: MoE (Shazeer 2017)', 'Paper', 2.0, false),
('2026-03-05', 'Routing mechanisms: MoE (Shazeer 2017)', 'Paper', 1.5, false),
('2026-03-05', 'Scaling properties: MoE (Shazeer 2017)', 'Paper', 1.5, false),
('2026-03-05', 'Production challenges: RAG Module 5', 'Course', 0.5, false),
('2026-03-05', 'Agentic RAG use case: Agents Unit 3', 'Course', 0.33, false),

('2026-03-06', 'Simplified MoE routing: Switch Transformers', 'Paper', 2.0, false),
('2026-03-06', 'Scaling experiments: Switch Transformers', 'Paper', 1.5, false),
('2026-03-06', 'Training strategies: Switch Transformers', 'Paper', 1.5, false),
('2026-03-06', 'Evaluation strategies: RAG Module 5', 'Course', 0.5, false),
('2026-03-06', 'Use case continued: Agents Unit 3', 'Course', 0.33, false),

('2026-03-07', 'Architecture details: Mixtral', 'Paper', 2.0, false),
('2026-03-07', 'Performance analysis: Mixtral', 'Paper', 1.0, false),
('2026-03-07', 'Open-source implications: Mixtral', 'Paper', 1.0, false),
('2026-03-07', 'Logging & monitoring: RAG Module 5', 'Course', 1.0, false),
('2026-03-07', 'Building custom agents: Agents Unit 3', 'Course', 0.5, false),
('2026-03-07', 'End-to-end application: MCP Unit 2', 'Course', 0.5, false),

('2026-03-08', 'Upcycling methodology: Sparse Upcycling', 'Paper', 2.0, false),
('2026-03-08', 'Dense to sparse conversion: Sparse Upcycling', 'Paper', 1.0, false),
('2026-03-08', 'Efficiency gains: Sparse Upcycling', 'Paper', 1.0, false),
('2026-03-08', 'Fine-tune LLMs: HF LLM Ch 11', 'Course', 1.0, false),
('2026-03-08', 'Tracing RAG systems: RAG Module 5', 'Course', 0.5, false),
('2026-03-08', 'Final project intro: Agents Unit 4', 'Course', 0.5, false),
('2026-03-08', 'Building MCP apps: MCP Unit 2', 'Course', 0.5, false),

('2026-03-09', 'Model architecture: DeepSeek-R1', 'Paper', 2.5, false),
('2026-03-09', 'Reasoning capabilities: DeepSeek-R1', 'Paper', 1.5, false),
('2026-03-09', 'Training methodology: DeepSeek-R1', 'Paper', 1.0, false),
('2026-03-09', 'Evaluation + results: DeepSeek-R1', 'Paper', 1.0, false),
('2026-03-09', 'Fine-tuning continued: HF LLM Ch 11', 'Course', 0.5, false),
('2026-03-09', 'Application continued: MCP Unit 2', 'Course', 0.33, false),
('2026-03-09', 'Choose Week 4 song + first listen: English Song', 'Activity', 0.25, false),

('2026-03-10', 'Architecture innovations: Qwen3 Technical Report', 'Paper', 2.0, false),
('2026-03-10', 'Training details: Qwen3 Technical Report', 'Paper', 1.5, false),
('2026-03-10', 'Multilingual capabilities: Qwen3 Technical Report', 'Paper', 1.5, false),
('2026-03-10', 'Customized evaluation: RAG Module 5', 'Course', 0.5, false),
('2026-03-10', 'Agent testing: Agents Unit 4', 'Course', 0.5, false),
('2026-03-10', 'Advanced development: MCP Unit 3', 'Course', 0.33, false),

('2026-03-11', 'Review Week 4 papers', 'Review', 2.0, false),
('2026-03-11', 'MoE evolution synthesis', 'Review', 1.0, false),
('2026-03-11', 'Modern architectures comparison', 'Review', 1.0, false),
('2026-03-11', 'Practice: English Song', 'Activity', 0.5, false),

-- Week 5: Large Models & Theory (Mar 12-18)
('2026-03-12', 'Pathways architecture: PaLM', 'Paper', 2.0, false),
('2026-03-12', 'Scaling insights: PaLM', 'Paper', 1.5, false),
('2026-03-12', 'Emergent capabilities: PaLM', 'Paper', 1.5, false),
('2026-03-12', 'Quantization: RAG Module 5', 'Course', 0.5, false),
('2026-03-12', 'Certification prep: Agents Unit 4', 'Course', 0.33, false),
('2026-03-12', 'Custom workflows: MCP Unit 3', 'Course', 0.33, false),

('2026-03-13', 'Generalist language model: GLaM', 'Paper', 2.0, false),
('2026-03-13', 'MoE at scale: GLaM', 'Paper', 1.0, false),
('2026-03-13', 'Efficiency comparison: GLaM', 'Paper', 1.0, false),
('2026-03-13', 'Cost vs quality tradeoffs: RAG Module 5', 'Course', 1.0, false),
('2026-03-13', 'Security considerations: RAG Module 5', 'Course', 0.5, false),
('2026-03-13', 'Fine-tuning for function calling: Agents Bonus 1', 'Course', 0.5, false),
('2026-03-13', 'Hub integration: MCP Unit 3', 'Course', 0.33, false),

('2026-03-14', 'Convergence theory: Platonic Representation Hypothesis', 'Paper', 2.0, false),
('2026-03-14', 'Multi-modal analysis: Platonic Representation Hypothesis', 'Paper', 1.5, false),
('2026-03-14', 'Implications + evidence: Platonic Representation Hypothesis', 'Paper', 1.5, false),
('2026-03-14', 'Multimodal RAG: RAG Module 5', 'Course', 0.5, false),
('2026-03-14', 'Function calling continued: Agents Bonus 1', 'Course', 0.5, false),
('2026-03-14', 'PR agent use case: MCP Unit 3', 'Course', 0.33, false),

('2026-03-15', 'Data quality insights: Textbooks Are All You Need', 'Paper', 2.0, false),
('2026-03-15', 'Synthetic data generation: Textbooks Are All You Need', 'Paper', 1.0, false),
('2026-03-15', 'Training implications: Textbooks Are All You Need', 'Paper', 1.0, false),
('2026-03-15', 'Build reasoning models: HF LLM Ch 12', 'Course', 2.0, false),
('2026-03-15', 'Observability intro: Agents Bonus 2', 'Course', 0.5, false),
('2026-03-15', 'Bonus content: MCP Unit 4', 'Course', 0.33, false),

('2026-03-16', 'Interpretability methods: Scaling Monosemanticity', 'Paper', 2.0, false),
('2026-03-16', 'Feature discovery: Scaling Monosemanticity', 'Paper', 1.5, false),
('2026-03-16', 'Scaling analysis: Scaling Monosemanticity', 'Paper', 1.5, false),
('2026-03-16', 'Reasoning models continued: HF LLM Ch 12', 'Course', 1.0, false),
('2026-03-16', 'Agent evaluation: Agents Bonus 2', 'Course', 0.5, false),
('2026-03-16', 'Choose Week 5 song + first listen: English Song', 'Activity', 0.25, false),

('2026-03-17', 'Practical training tips: Smol Training Playbook', 'Paper', 1.5, false),
('2026-03-17', 'Infrastructure choices: Smol Training Playbook', 'Paper', 1.0, false),
('2026-03-17', 'Best practices: Smol Training Playbook', 'Paper', 0.5, false),
('2026-03-17', 'Final exercises: HF LLM Ch 12', 'Course', 2.0, false),
('2026-03-17', 'Evaluation continued: Agents Bonus 2', 'Course', 1.0, false),
('2026-03-17', 'Advanced topics: MCP Unit 4', 'Course', 0.5, false),

('2026-03-18', 'Review Week 5 papers', 'Review', 2.0, false),
('2026-03-18', 'Theory synthesis', 'Review', 1.0, false),
('2026-03-18', 'Practical implications', 'Review', 1.0, false),
('2026-03-18', 'Practice: English Song', 'Activity', 0.5, false),

-- Week 6: Integration & Mastery (Mar 19-25)
('2026-03-19', 'Cross-paper connections - Transformer evolution timeline', 'Integration', 1.0, false),
('2026-03-19', 'Cross-paper connections - Scaling laws across papers', 'Integration', 1.0, false),
('2026-03-19', 'Cross-paper connections - Architecture innovations', 'Integration', 1.0, false),
('2026-03-19', 'Pokemon agents intro: Agents Bonus 3', 'Course', 1.0, false),
('2026-03-19', 'Course completion review: MCP', 'Course', 0.5, false),
('2026-03-19', 'Final review: RAG', 'Course', 0.5, false),

('2026-03-20', 'Attention mechanisms evolution - Standard → Flash → Variants', 'DeepDive', 1.5, false),
('2026-03-20', 'Attention mechanisms evolution - Position encodings comparison', 'DeepDive', 1.5, false),
('2026-03-20', 'Pokemon battle agents: Agents Bonus 3', 'Course', 1.0, false),
('2026-03-20', 'HF ecosystem: Course Integration', 'Course', 1.0, false),

('2026-03-21', 'Training methodologies - Pre-training strategies', 'DeepDive', 1.0, false),
('2026-03-21', 'Training methodologies - Fine-tuning approaches', 'DeepDive', 1.0, false),
('2026-03-21', 'Training methodologies - Alignment techniques', 'DeepDive', 1.0, false),
('2026-03-21', 'Agent implementation: Agents Bonus 3', 'Course', 1.0, false),
('2026-03-21', 'RAG systems: Course Integration', 'Course', 1.0, false),

('2026-03-22', 'Reasoning & inference - CoT → ReAct → DeepSeek-R1', 'DeepDive', 1.5, false),
('2026-03-22', 'Reasoning & inference - Inference optimization', 'DeepDive', 1.5, false),
('2026-03-22', 'Final exercises: All Courses', 'Course', 2.0, false),

('2026-03-23', 'MoE architectures - From basics to modern implementations', 'DeepDive', 1.5, false),
('2026-03-23', 'MoE architectures - Efficiency analysis', 'DeepDive', 1.5, false),
('2026-03-23', 'Certification prep: All Courses', 'Course', 2.0, false),
('2026-03-23', 'Choose Week 6 song + first listen: English Song', 'Activity', 0.25, false),

('2026-03-24', 'Comprehensive Review: All papers taxonomy', 'Review', 3.0, false),
('2026-03-24', 'Implementation Planning: Personal project ideas', 'Review', 2.0, false),

('2026-03-25', 'Week 6 synthesis', 'Review', 2.0, false),
('2026-03-25', 'Create master reference document', 'Review', 2.0, false),
('2026-03-25', 'Practice: English Song', 'Activity', 0.5, false),

-- Week 7: Final Review & Mastery (Mar 26-31)
('2026-03-26', 'Paper Review Session 1 - Attention, Transformers, BERT, GPT-3', 'FinalReview', 3.0, false),
('2026-03-26', 'HF LLM Course complete review', 'FinalReview', 2.0, false),

('2026-03-27', 'Paper Review Session 2 - Scaling laws, Chinchilla, LLaMA, optimizations', 'FinalReview', 3.0, false),
('2026-03-27', 'RAG Course complete review', 'FinalReview', 2.0, false),

('2026-03-28', 'Paper Review Session 3 - RAG, alignment, reasoning, MoE papers', 'FinalReview', 3.0, false),
('2026-03-28', 'Agents Course complete review', 'FinalReview', 2.0, false),

('2026-03-29', 'Paper Review Session 4 - DeepSeek-R1, Qwen3, theory papers', 'FinalReview', 3.0, false),
('2026-03-29', 'MCP Course complete review', 'FinalReview', 1.0, false),
('2026-03-29', 'Build concept map', 'Integration', 1.0, false),

('2026-03-30', 'Create comprehensive study summary', 'FinalSynthesis', 2.0, false),
('2026-03-30', 'Key insights document', 'FinalSynthesis', 1.0, false),
('2026-03-30', 'Future learning roadmap', 'FinalSynthesis', 1.0, false),
('2026-03-30', 'Quiz yourself on all topics', 'Practice', 1.0, false),
('2026-03-30', 'Practice all 6 songs: All Songs Review', 'Activity', 0.5, false),

('2026-03-31', 'Personal reflection: Final Review', 'Completion', 2.0, false),
('2026-03-31', 'Organize all notes: Documentation', 'Completion', 2.0, false),
('2026-03-31', 'Next steps & advanced topics: Planning', 'Completion', 1.0, false),
('2026-03-31', 'Acknowledge completion: Celebration', 'Completion', 0.5, false);
