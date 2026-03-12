-- ============================================================
--  HOSTEL & LIBRARY MANAGEMENT v5 — Supabase Schema
--  Run this entire file in Supabase SQL Editor
-- ============================================================

-- HOSTEL STUDENTS
create table if not exists hostel_students (
  id text primary key,
  name text not null,
  room text,
  course text,
  phone text,
  email text,
  dob text,
  joining_date text,
  exit_date text,
  monthly_fee_amount numeric default 0,
  fee_day integer default 1,
  override_due_date integer,
  discount numeric default 0,
  notes text,
  created_at timestamp default now()
);

-- LEAVES
create table if not exists leaves (
  id text primary key,
  student_id text references hostel_students(id) on delete cascade,
  student_name text,
  from_date text,
  to_date text,
  reason text,
  status text default 'approved',
  is_current boolean default true,
  created_at timestamp default now()
);

-- HOSTEL MONTHLY FEES
create table if not exists monthly_fees (
  id text primary key,
  student_id text references hostel_students(id) on delete cascade,
  student_name text,
  month integer,
  year integer,
  due_date text,
  total_amount numeric default 0,
  discount numeric default 0,
  net_amount numeric default 0,
  paid_amount numeric default 0,
  balance numeric default 0,
  status text default 'pending',
  mode text,
  note text,
  drive_file_id text,
  drive_file_url text,
  created_at timestamp default now()
);

-- LIBRARY MEMBERS
create table if not exists library_members (
  id text primary key,
  name text not null,
  phone text,
  email text,
  seat_number text,
  course text,
  dob text,
  joining_date text,
  exit_date text,
  monthly_fee_amount numeric default 0,
  fee_day integer default 1,
  override_due_date integer,
  discount numeric default 0,
  linked_hostel_id text references hostel_students(id) on delete set null,
  notes text,
  created_at timestamp default now()
);

-- LIBRARY MONTHLY FEES
create table if not exists library_fees (
  id text primary key,
  member_id text references library_members(id) on delete cascade,
  member_name text,
  month integer,
  year integer,
  due_date text,
  total_amount numeric default 0,
  discount numeric default 0,
  net_amount numeric default 0,
  paid_amount numeric default 0,
  balance numeric default 0,
  status text default 'pending',
  mode text,
  note text,
  drive_file_id text,
  drive_file_url text,
  created_at timestamp default now()
);

-- DELETED RECORDS
create table if not exists deleted_records (
  id serial primary key,
  deleted_at text,
  module text,
  original_id text,
  name text,
  data text,
  created_at timestamp default now()
);

-- PAYMENT LOG
create table if not exists payment_log (
  id text primary key,
  txn_date text,
  module text,
  student_id text,
  student_name text,
  month integer,
  year integer,
  amount numeric,
  mode text,
  note text,
  fee_record_id text,
  created_at timestamp default now()
);

-- BROADCAST LOG
create table if not exists broadcast_log (
  id serial primary key,
  sent_at text,
  subject text,
  recipients integer,
  message text,
  created_at timestamp default now()
);

-- APP SETTINGS (single row)
create table if not exists app_settings (
  id integer primary key default 1,
  inst_name text default 'Coaching Institute',
  admin_email text default '',
  wa_template text default 'Dear {name}, your fee Rs.{net} for {month} {year} is due on {dueDate}. Balance: Rs.{balance}.',
  reminder_days text default '7,3,1',
  reminder_hour integer default 9
);
insert into app_settings (id) values (1) on conflict do nothing;

-- Enable Row Level Security (disable for simplicity — add auth later if needed)
alter table hostel_students enable row level security;
alter table leaves enable row level security;
alter table monthly_fees enable row level security;
alter table library_members enable row level security;
alter table library_fees enable row level security;
alter table deleted_records enable row level security;
alter table payment_log enable row level security;
alter table broadcast_log enable row level security;
alter table app_settings enable row level security;

-- Allow all operations (open access — add auth later if you want login)
create policy "allow_all_students"    on hostel_students    for all using (true) with check (true);
create policy "allow_all_leaves"      on leaves             for all using (true) with check (true);
create policy "allow_all_fees"        on monthly_fees       for all using (true) with check (true);
create policy "allow_all_lib"         on library_members    for all using (true) with check (true);
create policy "allow_all_lib_fees"    on library_fees       for all using (true) with check (true);
create policy "allow_all_deleted"     on deleted_records    for all using (true) with check (true);
create policy "allow_all_payments"    on payment_log        for all using (true) with check (true);
create policy "allow_all_broadcast"   on broadcast_log      for all using (true) with check (true);
create policy "allow_all_settings"    on app_settings       for all using (true) with check (true);
