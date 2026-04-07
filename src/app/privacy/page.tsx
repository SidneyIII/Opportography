import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Privacy Policy — Opportography',
  description: 'How Opportography collects, uses, and protects your personal information.',
}

const sections = [
  {
    title: 'Information We Collect',
    body: `When you create an account, we collect information you provide directly, including your name, email address, and profile details such as your background, goals, and identity information used to personalize opportunity matching. We also collect usage data — pages visited, features used, and interactions with the Platform — to improve our service. No payment information is collected or stored by Opportography.`,
  },
  {
    title: 'How We Use Your Information',
    body: `We use your information to: (a) operate and improve the Platform; (b) power our AI matching engine to surface relevant local opportunities based on your profile; (c) send notifications about saved opportunities, new listings, or upcoming deadlines (only if you opt in); (d) respond to support requests; and (e) analyze aggregate usage trends to improve the service. We do not use your data for advertising or sell it to third parties.`,
  },
  {
    title: 'AI Matching & Profile Data',
    body: `Opportography uses an AI model to generate opportunity match scores and recommendations based on your profile. This data is processed server-side and is not shared with external AI providers in a way that identifies you personally. Match results are stored to improve future recommendations and allow you to review your history. You may delete your profile and all associated data at any time from your account settings.`,
  },
  {
    title: 'Data Storage & Security',
    body: `Your data is stored securely using Supabase, a SOC 2 compliant infrastructure provider. We use row-level security to ensure that your personal data is only accessible to you and authorized system processes. All data is transmitted over HTTPS. While we take reasonable precautions to protect your information, no internet transmission is 100% secure, and we cannot guarantee absolute security.`,
  },
  {
    title: 'Cookies & Local Storage',
    body: `Opportography uses session cookies and local storage to maintain your authentication state and platform preferences. We do not use third-party tracking cookies or advertising pixels. You may disable cookies in your browser settings, but doing so may limit your ability to use authenticated features of the Platform.`,
  },
  {
    title: 'Third-Party Services',
    body: `We use the following third-party services to operate the Platform: Supabase (database and authentication), Vercel (hosting and deployment), and Anthropic (AI model processing for opportunity matching). Each of these providers has their own privacy policies governing their handling of data. We share only the minimum data necessary with each provider to operate the service.`,
  },
  {
    title: 'Children\'s Privacy',
    body: `Opportography is designed to serve high school and college-aged users, including those under 18. We do not knowingly collect personal data from children under 13. If you believe a child under 13 has created an account without parental consent, please contact us immediately through the Support page and we will delete the account promptly.`,
  },
  {
    title: 'Your Rights',
    body: `You have the right to: (a) access the personal data we hold about you; (b) request correction of inaccurate information; (c) request deletion of your account and all associated data; (d) opt out of non-essential communications at any time. To exercise any of these rights, visit your account settings or contact us through the Support page.`,
  },
  {
    title: 'Changes to This Policy',
    body: `We may update this Privacy Policy from time to time. When we do, we will update the "Last updated" date at the top of this page. Continued use of the Platform after changes take effect constitutes your acceptance of the revised policy. We encourage you to review this page periodically.`,
  },
  {
    title: 'Contact',
    body: `If you have questions about this Privacy Policy or how your data is handled, please reach out through the Support page at opportography.vercel.app/support.`,
  },
]

export default function PrivacyPage() {
  return (
    <main className="mx-auto max-w-4xl px-4 py-16">
      <div className="mb-10 text-center">
        <h1 className="font-display text-4xl font-bold text-white md:text-5xl">
          Privacy <span className="text-cyan-400">Policy</span>
        </h1>
        <p className="mt-3 text-sm text-slate-400">Last updated: January 2026</p>
      </div>

      <div className="flex flex-col gap-4">
        {sections.map((section, i) => (
          <div
            key={i}
            className="rounded-xl border border-navy-600 bg-navy-800 px-7 py-6"
            style={{ background: 'rgba(20, 28, 53, 0.80)' }}
          >
            <h2 className="mb-3 text-base font-bold text-cyan-400">
              {i + 1}. {section.title}
            </h2>
            <p className="text-sm leading-relaxed text-white">{section.body}</p>
          </div>
        ))}
      </div>
    </main>
  )
}
