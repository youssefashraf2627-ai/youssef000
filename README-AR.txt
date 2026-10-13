CAIRO SCIVERSE — الملفات كلها في مستوى واحد بدون مجلدات

الملفات:
- index.html: موقع Cairo SciVerse الأصلي.
- dashboard.html: لوحة التحكم المربوطة بـ Supabase.
- supabase-schema.sql: كود إنشاء الجداول وسياسات حماية البيانات.
- باقي الملفات: صور وخطوط ومكتبات محلية يحتاجها الموقع.

طريقة التشغيل:
1) شغّل supabase-schema.sql داخل Supabase > SQL Editor > New query.
2) افتح dashboard.html، وأدخل Project URL وPublishable/anon key من إعدادات Supabase.
3) أنشئ حسابًا أو سجّل الدخول. يمكن إضافة المنتجات والطلبات من لوحة التحكم.
4) ارفع كل الملفات الموجودة في هذا المجلد إلى GitHub بنفس المستوى (root). لا ترفع ZIP نفسه فقط.
5) في Vercel اختر مشروعًا من نوع Other/Static إذا كنت تنشر هذه النسخة المسطحة، وتأكد أن index.html في جذر المستودع.

ملاحظات:
- الصفحة الأصلية تستخدم مكتبات CDN؛ يتطلب تحميلها اتصال إنترنت.
- dashboard.html تستخدم المفتاح العام فقط. لا تضع service_role/secret key في HTML.
- جداول المنتجات والطلبات محمية بـ Row Level Security؛ كل مستخدم يرى سجلاته فقط.
- لوحة التحكم منفصلة في dashboard.html حتى لا تغيّر الصفحة الأصلية index.html.
