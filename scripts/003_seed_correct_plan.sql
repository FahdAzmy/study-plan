-- Seed correct LLM Study Plan (Feb 12 - Mar 31, 2026)
-- 48 days organized by week

INSERT INTO tasks (task_date, title, category, estimated_hours, completed) VALUES

-- WEEK 1: Foundation Phase (Feb 12-18)
-- Day 1 (Feb 12, Wed)
('2026-02-12', 'Read paper sections 1-3: Attention Is All You Need', 'Paper', 1.5, false),
('2026-02-12', 'Break + notes', 'Break', 0.5, false),
('2026-02-12', 'Sections 4-6 + implementation details: Attention Is All You Need', 'Paper', 1.0, false),
('2026-02-12', 'Setup: HF LLM Ch 0', 'Course', 0.5, false),
('2026-02-12', 'Introduction: HF LLM Ch 1', 'Course', 0.5, false),
('2026-02-12', 'RAG Overview: RAG Module 1', 'Course', 0.33, false),

-- Day 2 (Feb 13, Thu)
('2026-02-13', 'Re-read complex sections + math: Attention Is All You Need', 'Paper', 1.5, false),
('2026-02-13', 'Implementation notes: Attention Is All You Need', 'Paper', 1.0, false),
('2026-02-13', 'Connect to modern variants: Attention Is All You Need', 'Paper', 0.5, false),
('2026-02-13', 'Transformers capabilities: HF LLM Ch 1', 'Course', 0.67, false),
('2026-02-13', 'Applications: RAG Module 1', 'Course', 0.33, false),

-- Day 3 (Feb 14, Fri)
('2026-02-14', 'Visual walkthrough + understanding: The Illustrated Transformer', 'Paper', 2.0, false),
('2026-02-14', 'Compare with original paper: The Illustrated Transformer', 'Paper', 1.0, false),
('2026-02-14', 'Architecture details: HF LLM Ch 1', 'Course', 0.67, false),
('2026-02-14', 'Intro to LLMs: RAG Module 1', 'Course', 0.33, false),

-- Day 4 (Feb 15, Sat)
('2026-02-15', 'Paper reading: BERT', 'Paper', 2.0, false),
('2026-02-15', 'Pre-training objectives: BERT', 'Paper', 1.0, false),
('2026-02-15', 'Fine-tuning strategies: BERT', 'Paper', 1.0, false),
('2026-02-15', 'Implementation insights: BERT', 'Paper', 1.0, false),
('2026-02-15', 'Using Transformers: HF LLM Ch 2', 'Course', 0.5, false),
('2026-02-15', 'Information Retrieval intro: RAG Module 2', 'Course', 0.33, false),

-- Day 5 (Feb 16, Sun)
('2026-02-16', 'Review + notes consolidation: BERT', 'Paper', 1.0, false),
('2026-02-16', 'Main paper sections: GPT-3', 'Paper', 2.0, false),
('2026-02-16', 'Scaling experiments: GPT-3', 'Paper', 1.0, false),
('2026-02-16', 'In-context learning: GPT-3', 'Paper', 1.0, false),
('2026-02-16', 'Pipeline API: HF LLM Ch 2', 'Course', 0.5, false),
('2026-02-16', 'Choose + first listen: English Song', 'Activity', 0.25, false),

-- Day 6 (Feb 17, Mon)
('2026-02-17', 'Analysis + comparison with BERT: GPT-3', 'Paper', 2.0, false),
('2026-02-17', 'Models and tokenizers: HF LLM Ch 2', 'Course', 1.0, false),
('2026-02-17', 'Fine-tuning intro: HF LLM Ch 3', 'Course', 1.0, false),
('2026-02-17', 'Retriever architecture: RAG Module 2', 'Course', 0.5, false),
('2026-02-17', 'Intro to agents: Agents Unit 1', 'Course', 0.33, false),

-- Day 7 (Feb 18, Tue) - REVIEW DAY
('2026-02-18', 'Review Week 1 papers', 'Review', 2.0, false),
('2026-02-18', 'Consolidate notes from courses', 'Review', 1.0, false),
('2026-02-18', 'Create concept map connecting papers', 'Review', 1.0, false),
('2026-02-18', 'Practice: English Song', 'Activity', 0.5, false),

-- WEEK 2: Scaling & Architecture (Feb 19-25)
-- Day 8 (Feb 19, Wed)
('2026-02-19', 'Main findings + equations: Scaling Laws (Kaplan)', 'Paper', 2.0, false),
('2026-02-19', 'Experimental results: Scaling Laws (Kaplan)', 'Paper', 1.5, false),
('2026-02-19', 'Implications for training: Scaling Laws (Kaplan)', 'Paper', 1.5, false),
('2026-02-19', 'Fine-tuning: HF LLM Ch 3', 'Course', 0.5, false),
('2026-02-19', 'Search methods: RAG Module 2', 'Course', 0.33, false),

-- Day 9 (Feb 20, Thu)
('2026-02-20', 'Optimal compute allocation: Chinchilla', 'Paper', 2.0, false),
('2026-02-20', 'Comparison with Kaplan: Chinchilla', 'Paper', 1.5, false),
('2026-02-20', 'Training methodology: Chinchilla', 'Paper', 1.5, false),
('2026-02-20', 'Sharing models: HF LLM Ch 4', 'Course', 0.5, false),
('2026-02-20', 'Vector embeddings: RAG Module 2', 'Course', 0.33, false),

-- Day 10 (Feb 21, Fri)
('2026-02-21', 'Architecture choices: LLaMA', 'Paper', 2.0, false),
('2026-02-21', 'Training details: LLaMA', 'Paper', 1.5, false),
('2026-02-21', 'Evaluation + efficiency: LLaMA', 'Paper', 1.5, false),
('2026-02-21', 'Datasets library: HF LLM Ch 5', 'Course', 0.5, false),
('2026-02-21', 'Hybrid search: RAG Module 2', 'Course', 0.33, false),

-- Day 11 (Feb 22, Sat)
('2026-02-22', 'Rotary position embeddings: RoFormer', 'Paper', 2.0, false),
('2026-02-22', 'Mathematical foundations: RoFormer', 'Paper', 1.0, false),
('2026-02-22', 'Implementation + benefits: RoFormer', 'Paper', 1.0, false),
('2026-02-22', 'Data processing: HF LLM Ch 5', 'Course', 1.0, false),
('2026-02-22', 'Tools and actions: Agents Unit 1', 'Course', 0.5, false),
('2026-02-22', 'Vector databases intro: RAG Module 3', 'Course', 0.33, false),

-- Day 12 (Feb 23, Sun)
('2026-02-23', 'Algorithm design: FlashAttention', 'Paper', 2.0, false),
('2026-02-23', 'Memory hierarchy optimization: FlashAttention', 'Paper', 1.5, false),
('2026-02-23', 'Performance analysis: FlashAttention', 'Paper', 1.5, false),
('2026-02-23', 'Tokenizers: HF LLM Ch 6', 'Course', 0.5, false),
('2026-02-23', 'LLMs and messages: Agents Unit 1', 'Course', 0.33, false),
('2026-02-23', 'Choose Week 2 song + first listen: English Song', 'Activity', 0.25, false),

-- Day 13 (Feb 24, Mon)
('2026-02-24', 'Tokenizers deep dive: HF LLM Ch 6', 'Course', 2.0, false),
('2026-02-24', 'Classical NLP tasks: HF LLM Ch 7', 'Course', 1.0, false),
('2026-02-24', 'Weaviate API: RAG Module 3', 'Course', 1.0, false),
('2026-02-24', 'Simple use case: Agents Unit 1', 'Course', 1.0, false),

-- Day 14 (Feb 25, Tue) - REVIEW DAY
('2026-02-25', 'Review Week 2 papers', 'Review', 2.0, false),
('2026-02-25', 'Compare scaling papers', 'Review', 1.0, false),
('2026-02-25', 'Architecture evolution notes', 'Review', 1.0, false),
('2026-02-25', 'Practice: English Song', 'Activity', 0.5, false),

-- WEEK 3: Applications & Alignment (Feb 26 - Mar 4)
-- Day 15 (Feb 26, Wed)
('2026-02-26', 'Architecture + methodology: RAG', 'Paper', 2.0, false),
('2026-02-26', 'Retrieval strategies: RAG', 'Paper', 1.0, false),
('2026-02-26', 'Generation integration: RAG', 'Paper', 1.0, false),
('2026-02-26', 'NLP tasks continued: HF LLM Ch 7', 'Course', 1.0, false),
('2026-02-26', 'Chunking strategies: RAG Module 3', 'Course', 0.5, false),
('2026-02-26', 'Framework intro: Agents Unit 2', 'Course', 0.33, false),

-- Day 16 (Feb 27, Thu)
('2026-02-27', 'RLHF methodology: InstructGPT', 'Paper', 2.0, false),
('2026-02-27', 'Reward modeling: InstructGPT', 'Paper', 1.5, false),
('2026-02-27', 'Alignment results: InstructGPT', 'Paper', 1.5, false),
('2026-02-27', 'How to ask for help: HF LLM Ch 8', 'Course', 0.5, false),
('2026-02-27', 'Reranking: RAG Module 3', 'Course', 0.33, false),

-- Day 17 (Feb 28, Fri)
('2026-02-28', 'Direct preference optimization: DPO', 'Paper', 2.0, false),
('2026-02-28', 'Comparison with RLHF: DPO', 'Paper', 1.5, false),
('2026-02-28', 'Implementation details: DPO', 'Paper', 1.5, false),
('2026-02-28', 'Building demos: HF LLM Ch 9', 'Course', 0.5, false),
('2026-02-28', 'LLM architecture: RAG Module 4', 'Course', 0.33, false),

-- Day 18 (Mar 1, Sat)
('2026-03-01', 'Prompting methodology: Chain-of-Thought', 'Paper', 2.0, false),
('2026-03-01', 'Reasoning capabilities: Chain-of-Thought', 'Paper', 1.0, false),
('2026-03-01', 'Applications + examples: Chain-of-Thought', 'Paper', 1.0, false),
('2026-03-01', 'Demo sharing: HF LLM Ch 9', 'Course', 1.0, false),
('2026-03-01', 'Sampling strategies: RAG Module 4', 'Course', 0.5, false),
('2026-03-01', 'smolagents: Agents Unit 2', 'Course', 0.5, false),
('2026-03-01', 'MCP fundamentals: MCP Unit 1', 'Course', 0.33, false),

-- Day 19 (Mar 2, Sun)
('2026-03-02', 'Reasoning + Acting paradigm: ReAct', 'Paper', 2.0, false),
('2026-03-02', 'Implementation: ReAct', 'Paper', 1.0, false),
('2026-03-02', 'Comparison with CoT: ReAct', 'Paper', 1.0, false),
('2026-03-02', 'Dataset curation: HF LLM Ch 10', 'Course', 1.0, false),
('2026-03-02', 'Prompt engineering: RAG Module 4', 'Course', 0.5, false),
('2026-03-02', 'LlamaIndex: Agents Unit 2', 'Course', 0.5, false),
('2026-03-02', 'Core concepts: MCP Unit 1', 'Course', 0.33, false),
('2026-03-02', 'Choose Week 3 song + first listen: English Song', 'Activity', 0.25, false),

-- Day 20 (Mar 3, Mon)
('2026-03-03', 'High-quality datasets: HF LLM Ch 10', 'Course', 2.0, false),
('2026-03-03', 'Handling hallucinations: RAG Module 4', 'Course', 1.0, false),
('2026-03-03', 'LLM evaluation: RAG Module 4', 'Course', 1.0, false),
('2026-03-03', 'LangGraph: Agents Unit 2', 'Course', 1.0, false),
('2026-03-03', 'Use cases: MCP Unit 1', 'Course', 0.5, false),

-- Day 21 (Mar 4, Tue) - REVIEW DAY
('2026-03-04', 'Review Week 3 papers', 'Review', 2.0, false),
('2026-03-04', 'RAG + Alignment synthesis', 'Review', 1.0, false),
('2026-03-04', 'Reasoning methods comparison', 'Review', 1.0, false),
('2026-03-04', 'Practice: English Song', 'Activity', 0.5, false),

-- WEEK 4: Advanced MoE & Modern Models (Mar 5-11)
-- Day 22 (Mar 5, Wed)
('2026-03-05', 'MoE architecture: MoE (Shazeer 2017)', 'Paper', 2.0, false),
('2026-03-05', 'Routing mechanisms: MoE (Shazeer 2017)', 'Paper', 1.5, false),
('2026-03-05', 'Scaling properties: MoE (Shazeer 2017)', 'Paper', 1.5, false),
('2026-03-05', 'Production challenges: RAG Module 5', 'Course', 0.5, false),
('2026-03-05', 'Agentic RAG use case: Agents Unit 3', 'Course', 0.33, false),

-- Day 23 (Mar 6, Thu)
('2026-03-06', 'Simplified MoE routing: Switch Transformers', 'Paper', 2.0, false),
('2026-03-06', 'Scaling experiments: Switch Transformers', 'Paper', 1.5, false),
('2026-03-06', 'Training strategies: Switch Transformers', 'Paper', 1.5, false),
('2026-03-06', 'Evaluation strategies: RAG Module 5', 'Course', 0.5, false),
('2026-03-06', 'Use case continued: Agents Unit 3', 'Course', 0.33, false),

-- Day 24 (Mar 7, Fri)
('2026-03-07', 'Architecture details: Mixtral', 'Paper', 2.0, false),
('2026-03-07', 'Performance analysis: Mixtral', 'Paper', 1.0, false),
('2026-03-07', 'Open-source implications: Mixtral', 'Paper', 1.0, false),
('2026-03-07', 'Logging & monitoring: RAG Module 5', 'Course', 1.0, false),
('2026-03-07', 'Building custom agents: Agents Unit 3', 'Course', 0.5, false),
('2026-03-07', 'End-to-end application: MCP Unit 2', 'Course', 0.5, false),

-- Day 25 (Mar 8, Sat)
('2026-03-08', 'Upcycling methodology: Sparse Upcycling', 'Paper', 2.0, false),
('2026-03-08', 'Dense to sparse conversion: Sparse Upcycling', 'Paper', 1.0, false),
('2026-03-08', 'Efficiency gains: Sparse Upcycling', 'Paper', 1.0, false),
('2026-03-08', 'Fine-tune LLMs: HF LLM Ch 11', 'Course', 1.0, false),
('2026-03-08', 'Tracing RAG systems: RAG Module 5', 'Course', 0.5, false),
('2026-03-08', 'Final project intro: Agents Unit 4', 'Course', 0.5, false),
('2026-03-08', 'Building MCP apps: MCP Unit 2', 'Course', 0.5, false),

-- Day 26 (Mar 9, Sun)
('2026-03-09', 'Model architecture: DeepSeek-R1', 'Paper', 2.5, false),
('2026-03-09', 'Reasoning capabilities: DeepSeek-R1', 'Paper', 1.5, false),
('2026-03-09', 'Training methodology: DeepSeek-R1', 'Paper', 1.0, false),
('2026-03-09', 'Evaluation + results: DeepSeek-R1', 'Paper', 1.0, false),
('2026-03-09', 'Fine-tuning continued: HF LLM Ch 11', 'Course', 0.5, false),
('2026-03-09', 'Application continued: MCP Unit 2', 'Course', 0.33, false),
('2026-03-09', 'Choose Week 4 song + first listen: English Song', 'Activity', 0.25, false),

-- Day 27 (Mar 10, Mon)
('2026-03-10', 'Architecture innovations: Qwen3 Technical Report', 'Paper', 2.0, false),
('2026-03-10', 'Training details: Qwen3 Technical Report', 'Paper', 1.5, false),
('2026-03-10', 'Multilingual capabilities: Qwen3 Technical Report', 'Paper', 1.5, false),
('2026-03-10', 'Customized evaluation: RAG Module 5', 'Course', 0.5, false),
('2026-03-10', 'Agent testing: Agents Unit 4', 'Course', 0.5, false),
('2026-03-10', 'Advanced development: MCP Unit 3', 'Course', 0.33, false),

-- Day 28 (Mar 11, Tue) - REVIEW DAY
('2026-03-11', 'Review Week 4 papers', 'Review', 2.0, false),
('2026-03-11', 'MoE evolution synthesis', 'Review', 1.0, false),
('2026-03-11', 'Modern architectures comparison', 'Review', 1.0, false),
('2026-03-11', 'Practice: English Song', 'Activity', 0.5, false),

-- WEEK 5: Large Models & Theory (Mar 12-18)
-- Day 29 (Mar 12, Wed)
('2026-03-12', 'Pathways architecture: PaLM', 'Paper', 2.0, false),
('2026-03-12', 'Scaling insights: PaLM', 'Paper', 1.5, false),
('2026-03-12', 'Emergent capabilities: PaLM', 'Paper', 1.5, false),
('2026-03-12', 'Quantization: RAG Module 5', 'Course', 0.5, false),
('2026-03-12', 'Certification prep: Agents Unit 4', 'Course', 0.33, false),
('2026-03-12', 'Custom workflows: MCP Unit 3', 'Course', 0.33, false),

-- Day 30 (Mar 13, Thu)
('2026-03-13', 'Generalist language model: GLaM', 'Paper', 2.0, false),
('2026-03-13', 'MoE at scale: GLaM', 'Paper', 1.0, false),
('2026-03-13', 'Efficiency comparison: GLaM', 'Paper', 1.0, false),
('2026-03-13', 'Cost vs quality tradeoffs: RAG Module 5', 'Course', 1.0, false),
('2026-03-13', 'Security considerations: RAG Module 5', 'Course', 0.5, false),
('2026-03-13', 'Fine-tuning for function calling: Agents Bonus 1', 'Course', 0.5, false),
('2026-03-13', 'Hub integration: MCP Unit 3', 'Course', 0.33, false),

-- Day 31 (Mar 14, Fri)
('2026-03-14', 'Convergence theory: Platonic Representation Hypothesis', 'Paper', 2.0, false),
('2026-03-14', 'Multi-modal analysis: Platonic Representation Hypothesis', 'Paper', 1.5, false),
('2026-03-14', 'Implications + evidence: Platonic Representation Hypothesis', 'Paper', 1.5, false),
('2026-03-14', 'Multimodal RAG: RAG Module 5', 'Course', 0.5, false),
('2026-03-14', 'Function calling continued: Agents Bonus 1', 'Course', 0.5, false),
('2026-03-14', 'PR agent use case: MCP Unit 3', 'Course', 0.33, false),

-- Day 32 (Mar 15, Sat)
('2026-03-15', 'Data quality insights: Textbooks Are All You Need', 'Paper', 2.0, false),
('2026-03-15', 'Synthetic data generation: Textbooks Are All You Need', 'Paper', 1.0, false),
('2026-03-15', 'Training implications: Textbooks Are All You Need', 'Paper', 1.0, false),
('2026-03-15', 'Build reasoning models: HF LLM Ch 12', 'Course', 2.0, false),
('2026-03-15', 'Observability intro: Agents Bonus 2', 'Course', 0.5, false),
('2026-03-15', 'Bonus content: MCP Unit 4', 'Course', 0.33, false),

-- Day 33 (Mar 16, Sun)
('2026-03-16', 'Interpretability methods: Scaling Monosemanticity', 'Paper', 2.0, false),
('2026-03-16', 'Feature discovery: Scaling Monosemanticity', 'Paper', 1.5, false),
('2026-03-16', 'Scaling analysis: Scaling Monosemanticity', 'Paper', 1.5, false),
('2026-03-16', 'Reasoning models continued: HF LLM Ch 12', 'Course', 1.0, false),
('2026-03-16', 'Agent evaluation: Agents Bonus 2', 'Course', 0.5, false),
('2026-03-16', 'Choose Week 5 song + first listen: English Song', 'Activity', 0.25, false),

-- Day 34 (Mar 17, Mon)
('2026-03-17', 'Practical training tips: Smol Training Playbook', 'Paper', 1.5, false),
('2026-03-17', 'Infrastructure choices: Smol Training Playbook', 'Paper', 1.0, false),
('2026-03-17', 'Best practices: Smol Training Playbook', 'Paper', 0.5, false),
('2026-03-17', 'Final exercises: HF LLM Ch 12', 'Course', 2.0, false),
('2026-03-17', 'Evaluation continued: Agents Bonus 2', 'Course', 1.0, false),
('2026-03-17', 'Advanced topics: MCP Unit 4', 'Course', 0.5, false),

-- Day 35 (Mar 18, Tue) - REVIEW DAY
('2026-03-18', 'Review Week 5 papers', 'Review', 2.0, false),
('2026-03-18', 'Theory synthesis', 'Review', 1.0, false),
('2026-03-18', 'Practical implications', 'Review', 1.0, false),
('2026-03-18', 'Practice: English Song', 'Activity', 0.5, false),

-- WEEK 6: Integration & Mastery (Mar 19-25)
-- Day 36 (Mar 19, Wed)
('2026-03-19', 'Transformer evolution timeline: Integration', 'Integration', 1.0, false),
('2026-03-19', 'Scaling laws across papers: Integration', 'Integration', 1.0, false),
('2026-03-19', 'Architecture innovations: Integration', 'Integration', 1.0, false),
('2026-03-19', 'Pokemon agents intro: Agents Bonus 3', 'Course', 1.0, false),
('2026-03-19', 'Course completion review: MCP', 'Course', 0.5, false),
('2026-03-19', 'Final review: RAG', 'Course', 0.5, false),

-- Day 37 (Mar 20, Thu)
('2026-03-20', 'Standard → Flash → Variants: DeepDive', 'DeepDive', 1.5, false),
('2026-03-20', 'Position encodings comparison: DeepDive', 'DeepDive', 1.5, false),
('2026-03-20', 'Pokemon battle agents: Agents Bonus 3', 'Course', 1.0, false),
('2026-03-20', 'HF ecosystem: Course Integration', 'Course', 1.0, false),

-- Day 38 (Mar 21, Fri)
('2026-03-21', 'Pre-training strategies: DeepDive', 'DeepDive', 1.0, false),
('2026-03-21', 'Fine-tuning approaches: DeepDive', 'DeepDive', 1.0, false),
('2026-03-21', 'Alignment techniques: DeepDive', 'DeepDive', 1.0, false),
('2026-03-21', 'Agent implementation: Agents Bonus 3', 'Course', 1.0, false),
('2026-03-21', 'RAG systems: Course Integration', 'Course', 1.0, false),

-- Day 39 (Mar 22, Sat)
('2026-03-22', 'CoT → ReAct → DeepSeek-R1: DeepDive', 'DeepDive', 1.5, false),
('2026-03-22', 'Inference optimization: DeepDive', 'DeepDive', 1.5, false),
('2026-03-22', 'Final exercises: All Courses', 'Course', 2.0, false),

-- Day 40 (Mar 23, Sun)
('2026-03-23', 'From basics to modern implementations: DeepDive', 'DeepDive', 1.5, false),
('2026-03-23', 'Efficiency analysis: DeepDive', 'DeepDive', 1.5, false),
('2026-03-23', 'Certification prep: All Courses', 'Course', 2.0, false),
('2026-03-23', 'Choose Week 6 song + first listen: English Song', 'Activity', 0.25, false),

-- Day 41 (Mar 24, Mon)
('2026-03-24', 'All papers taxonomy: Comprehensive Review', 'Review', 3.0, false),
('2026-03-24', 'Personal project ideas: Implementation Planning', 'Review', 2.0, false),

-- Day 42 (Mar 25, Tue) - REVIEW DAY
('2026-03-25', 'Week 6 synthesis', 'Review', 2.0, false),
('2026-03-25', 'Create master reference document', 'Review', 2.0, false),
('2026-03-25', 'Practice: English Song', 'Activity', 0.5, false),

-- WEEK 7: Final Review & Mastery (Mar 26-31)
-- Day 43 (Mar 26, Wed)
('2026-03-26', 'Attention, Transformers, BERT, GPT-3: Paper Review Session 1', 'FinalReview', 3.0, false),
('2026-03-26', 'HF LLM Course complete review', 'FinalReview', 2.0, false),

-- Day 44 (Mar 27, Thu)
('2026-03-27', 'Scaling laws, Chinchilla, LLaMA, optimizations: Paper Review Session 2', 'FinalReview', 3.0, false),
('2026-03-27', 'RAG Course complete review', 'FinalReview', 2.0, false),

-- Day 45 (Mar 28, Fri)
('2026-03-28', 'RAG, alignment, reasoning, MoE papers: Paper Review Session 3', 'FinalReview', 3.0, false),
('2026-03-28', 'Agents Course complete review', 'FinalReview', 2.0, false),

-- Day 46 (Mar 29, Sat)
('2026-03-29', 'DeepSeek-R1, Qwen3, theory papers: Paper Review Session 4', 'FinalReview', 3.0, false),
('2026-03-29', 'MCP Course complete review', 'FinalReview', 1.0, false),
('2026-03-29', 'Build concept map', 'Integration', 1.0, false),

-- Day 47 (Mar 30, Sun)
('2026-03-30', 'Create comprehensive study summary: Final Synthesis', 'FinalSynthesis', 2.0, false),
('2026-03-30', 'Key insights document: Final Synthesis', 'FinalSynthesis', 1.0, false),
('2026-03-30', 'Future learning roadmap: Final Synthesis', 'FinalSynthesis', 1.0, false),
('2026-03-30', 'Quiz yourself on all topics', 'Practice', 1.0, false),
('2026-03-30', 'Practice all 6 songs: All Songs Review', 'Activity', 0.5, false),

-- Day 48 (Mar 31, Mon) - COMPLETION DAY
('2026-03-31', 'Personal reflection: Final Review', 'Completion', 2.0, false),
('2026-03-31', 'Organize all notes: Documentation', 'Completion', 2.0, false),
('2026-03-31', 'Next steps & advanced topics: Planning', 'Completion', 1.0, false),
('2026-03-31', 'Acknowledge completion: Celebration', 'Completion', 0.5, false);
