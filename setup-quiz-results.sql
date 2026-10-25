-- شغّل الملف مرة واحدة في Supabase SQL Editor.
-- تفاصيل مراجعة الإجابات وتاريخ النتيجة.
alter table public.quiz_results add column if not exists review_details jsonb not null default '[]'::jsonb;
alter table public.quiz_results add column if not exists created_at timestamptz not null default now();

-- صلاحية إعادة محاولة واحدة: صف واحد لكل طالب واختبار.
create table if not exists public.quiz_retake_permissions (
  user_id uuid not null references auth.users(id) on delete cascade,
  quiz_id bigint not null references public.quizzes(id) on delete cascade,
  granted_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  primary key (user_id, quiz_id)
);
alter table public.quiz_retake_permissions enable row level security;

drop policy if exists "quiz_retake_admin_all" on public.quiz_retake_permissions;
create policy "quiz_retake_admin_all" on public.quiz_retake_permissions
  for all to authenticated using (public.is_chemvirse_admin()) with check (public.is_chemvirse_admin());

drop policy if exists "quiz_retake_student_select_own" on public.quiz_retake_permissions;
create policy "quiz_retake_student_select_own" on public.quiz_retake_permissions
  for select to authenticated using (auth.uid() = user_id);

drop policy if exists "quiz_retake_student_delete_own" on public.quiz_retake_permissions;
create policy "quiz_retake_student_delete_own" on public.quiz_retake_permissions
  for delete to authenticated using (auth.uid() = user_id);

-- تمكين المسؤولين المعتمدين من قراءة نتائج الاختبارات.
alter table public.quiz_results enable row level security;
drop policy if exists "quiz_results_admin_select" on public.quiz_results;
create policy "quiz_results_admin_select" on public.quiz_results
  for select to authenticated using (public.is_chemvirse_admin());
