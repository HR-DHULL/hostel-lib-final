# 🚀 DEPLOY IN 15 MINUTES — Step by Step

## STEP 1 — Set up Supabase (your database) [5 min]

1. Go to https://supabase.com → click "Start your project" → sign up free
2. Click "New Project" → give it a name like "hostel-management" → set a password → click Create
3. Wait ~2 minutes for it to set up
4. In the left sidebar, click **"SQL Editor"**
5. Click **"New Query"**
6. Open the file **supabase_schema.sql** (from this folder) → copy ALL the text → paste it into the SQL editor
7. Click **"Run"** (or press Ctrl+Enter)
8. You should see "Success. No rows returned" — your database is ready!

## STEP 2 — Get your Supabase credentials [1 min]

1. In Supabase, click **"Project Settings"** (gear icon, bottom left)
2. Click **"API"**
3. Copy two values:
   - **Project URL** — looks like: `https://abcdefgh.supabase.co`
   - **anon public key** — a long string starting with `eyJ...`

## STEP 3 — Connect the app to Supabase [2 min]

1. Open **index.html** in any text editor (Notepad, VS Code, etc.)
2. Find these two lines near the top of the `<script>` section:
   ```
   var SUPABASE_URL = "YOUR_SUPABASE_URL";
   var SUPABASE_KEY = "YOUR_SUPABASE_ANON_KEY";
   ```
3. Replace with your actual values:
   ```
   var SUPABASE_URL = "https://abcdefgh.supabase.co";
   var SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...";
   ```
4. Save the file

## STEP 4 — Test locally [1 min]

1. Open index.html directly in your browser (double-click the file)
2. You should see your app load with the dashboard
3. Try adding a student to confirm it saves

## STEP 5 — Deploy to Netlify (get a real URL) [5 min]

1. Go to https://netlify.com → sign up free (use GitHub or email)
2. On the dashboard, look for **"Add new site"** → **"Deploy manually"**
3. Drag and drop the **entire folder** (containing index.html) onto the Netlify page
4. Netlify gives you a URL like: `https://amazing-name-123.netlify.app`
5. That's your live app URL — share it with anyone!

### Optional: Custom URL
- In Netlify, go to Site settings → Domain management → Add custom domain
- Or rename the auto-generated URL: Site settings → Change site name

---

## WHAT YOU GET

✅ Dashboard with stat cards (exact same as original)
✅ Students with search, filters, detail view
✅ Library members
✅ Monthly fees with 3-column layout (Paid / Partial / Pending)
✅ Fee payments with auto balance calculation
✅ Leave tracker
✅ WhatsApp reminder links
✅ Fee receipts (opens in new tab, printable)
✅ ID cards (printable)
✅ Advance payment
✅ Bulk mark paid
✅ CSV import with column mapping
✅ Broadcast (logs to database)
✅ Settings (institute name, WhatsApp template)
✅ All amounts in ₹ Indian Rupee format

---

## IMPORTANT NOTES

**Email sending:** The broadcast and reminder emails from the original app used Gmail via Google. 
For a standalone website, email requires a service like:
- **EmailJS** (free, 200 emails/month) — easiest, no server needed
- **Resend** (free, 100 emails/day)
For now, reminders work via WhatsApp links (📱 button on each student).

**Auto overdue marking:** The original used a Google time trigger. For a website, overdue marking happens automatically when you load the app (no server trigger needed — the fee status logic is built into the display).

**Data backup:** Your data is in Supabase. To export, go to Supabase Dashboard → Table Editor → any table → click the download button.

---

## TROUBLESHOOTING

| Problem | Solution |
|---|---|
| App shows "Setup Required" | You haven't added Supabase URL and Key to index.html |
| Data not loading | Check browser console (F12) for errors. Verify URL and Key are correct |
| "relation does not exist" error | Run the SQL schema again in Supabase SQL Editor |
| Can't add students | Make sure you ran the full SQL schema including the policies section |
| Netlify shows blank page | Make sure you uploaded index.html (not just the folder) |
