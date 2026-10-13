CAIRO SCIVERSE — النسخة المعدلة للربط بـ Supabase الجديد

تم تحديث index.html لاستخدام مشروع Supabase:
https://tithatfxtifjfamkmdcn.supabase.co

الخطوات:
1) افتح Supabase > SQL Editor > New query.
2) افتح supabase-schema.sql، انسخ محتواه بالكامل، الصقه في SQL Editor واضغط Run.
3) ارفع كل محتويات هذا المجلد إلى جذر مستودع GitHub (Root)، وليس ملف ZIP فقط.
4) إذا كان Vercel متصلًا بمستودع GitHub، انتظر انتهاء النشر ثم افتح الموقع.

تنبيه:
- مفتاح sb_publishable_ مستخدم في index.html وهو مفتاح واجهة عام، وليس secret/service_role.
- يجب ضبط سياسات المصادقة وRLS قبل إضافة بيانات حقيقية.
- ملف SQL ينشئ الجداول الأساسية فقط ولا يضيف محتوى المواد أو الامتحانات أو الأخبار.
- dashboard.html لوحة منفصلة للمنتجات والطلبات، وتطلب Project URL والمفتاح من داخل الصفحة. ملف SQL الأصلي للمنتجات والطلبات كان منفصلًا؛ تمت إضافة الجداول التعليمية إلى schema.
