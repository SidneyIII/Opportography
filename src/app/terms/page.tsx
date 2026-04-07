import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Terms & Conditions — Opportography',
  description: 'Terms and conditions for using the Opportography platform.',
}

const sections = [
  {
    title: 'Acceptance of Terms',
    body: `By accessing or using Opportography ("the Platform"), you agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use the Platform. Opportography reserves the right to update these terms at any time, and continued use of the Platform constitutes acceptance of any changes.`,
  },
  {
    title: 'Description of Service',
    body: `Opportography is a hyperlocal opportunity discovery platform that aggregates verified scholarships, internships, apprenticeships, community programs, and other resources within specific metropolitan areas. The Platform uses artificial intelligence to help users surface relevant opportunities based on their background and goals. Opportography is not an application portal — we surface opportunities; you apply directly with the sponsoring organization.`,
  },
  {
    title: 'User Accounts',
    body: `To access personalized features, you may create an account. You are responsible for maintaining the confidentiality of your credentials and for all activity that occurs under your account. You agree to provide accurate and complete information when creating a profile. Opportography reserves the right to suspend or terminate accounts that violate these terms or engage in fraudulent activity.`,
  },
  {
    title: 'Opportunity Listings',
    body: `Opportography strives to maintain accurate, verified listings. However, we cannot guarantee that every listing is current, complete, or available at the time of access. Opportunity details, deadlines, eligibility requirements, and availability are subject to change by the sponsoring organization. Users are encouraged to verify all information directly with the listing organization before applying.`,
  },
  {
    title: 'Prohibited Conduct',
    body: `You agree not to: (a) use the Platform for any unlawful purpose; (b) scrape, harvest, or systematically collect data from the Platform without prior written consent; (c) impersonate another person or entity; (d) attempt to gain unauthorized access to any portion of the Platform or its systems; (e) submit false, misleading, or fraudulent information; or (f) interfere with the proper functioning of the Platform in any way.`,
  },
  {
    title: 'Intellectual Property',
    body: `All content on the Platform — including but not limited to text, design, code, graphics, logos, and the Opportography name and brand — is the property of Opportography and is protected by applicable intellectual property laws. Opportunity descriptions attributed to third-party organizations remain the property of those organizations. You may not reproduce, distribute, or create derivative works from Platform content without explicit written permission.`,
  },
  {
    title: 'Privacy & Data',
    body: `Your use of the Platform is also governed by our Privacy Policy, incorporated herein by reference. By using Opportography, you consent to the collection, use, and storage of your information as described in the Privacy Policy. We do not sell personal data to third parties.`,
  },
  {
    title: 'Disclaimer of Warranties',
    body: `The Platform is provided on an "as is" and "as available" basis without warranties of any kind, either express or implied, including but not limited to warranties of merchantability, fitness for a particular purpose, or non-infringement. Opportography does not warrant that the Platform will be uninterrupted, error-free, or free of viruses or other harmful components.`,
  },
  {
    title: 'Limitation of Liability',
    body: `To the fullest extent permitted by law, Opportography and its founders, employees, and affiliates shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of — or inability to use — the Platform, including any reliance on opportunity listings or AI-generated match results. Our total liability for any claim arising from use of the Platform shall not exceed fifty dollars ($50).`,
  },
  {
    title: 'Governing Law',
    body: `These Terms and Conditions shall be governed by and construed in accordance with the laws of the State of Nebraska, without regard to its conflict-of-law provisions. Any disputes arising under these terms shall be resolved in the state or federal courts located in Douglas County, Nebraska.`,
  },
  {
    title: 'Contact',
    body: `If you have any questions about these Terms and Conditions, please contact us through the Support page at opportography.vercel.app/support.`,
  },
]

export default function TermsPage() {
  return (
    <main className="mx-auto max-w-4xl px-4 py-16">
      <div className="mb-10 text-center">
        <h1 className="font-display text-4xl font-bold text-white md:text-5xl">
          Terms &amp; <span className="text-cyan-400">Conditions</span>
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
