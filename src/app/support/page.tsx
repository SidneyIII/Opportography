export default function SupportPage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-8">
      <h1 className="font-display mb-6 text-2xl font-bold text-slate-50">Support Opportography</h1>

      <div className="space-y-8">
        <section className="rounded-xl border border-navy-600 bg-navy-800 p-6">
          <h2 className="font-display mb-3 text-lg font-bold text-slate-50">This platform is free. Always.</h2>
          <p className="leading-relaxed text-slate-300">
            Opportography will never charge students or families to access opportunities. Every
            scholarship, internship, program, and resource listed here is free to browse and free to
            save.
          </p>
        </section>

        <section className="rounded-xl border border-navy-600 bg-navy-800 p-6">
          <h2 className="font-display mb-3 text-lg font-bold text-slate-50">Pay What You Can</h2>
          <p className="leading-relaxed text-slate-300">
            If you&apos;d like to help keep Opportography running, you can contribute what you can.
            Every dollar helps us research more opportunities, verify listings, and expand to more
            cities.
          </p>
          <p className="mt-3 text-sm text-slate-500">
            This is completely optional. We&apos;d rather you spend your money on your future.
          </p>
          <div className="mt-6 flex flex-col gap-3 sm:flex-row">
            <a
              href="https://ko-fi.com/"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center justify-center rounded-lg bg-cyan-400 px-6 py-3 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300"
            >
              Support on Ko-fi
            </a>
            <a
              href="https://buymeacoffee.com/"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center justify-center rounded-lg border border-navy-600 px-6 py-3 text-sm font-semibold text-slate-300 transition-colors hover:border-slate-500 hover:text-slate-100"
            >
              Buy Me a Coffee
            </a>
          </div>
        </section>

        <section className="rounded-xl border border-navy-600 bg-navy-800 p-6">
          <h2 className="font-display mb-3 text-lg font-bold text-slate-50">Other Ways to Help</h2>
          <ul className="list-inside list-disc space-y-2 text-slate-400">
            <li>Share Opportography with a student, counselor, or community organization.</li>
            <li>Know of an opportunity we&apos;re missing? Let us know.</li>
            <li>
              Are you a school counselor? Share this site with your students — it&apos;s built for
              them.
            </li>
          </ul>
        </section>

        <div className="rounded-xl border border-cyan-400/20 bg-cyan-400/5 p-6 text-center">
          <p className="font-display text-lg font-semibold text-slate-50">
            The best way to support us? Use this platform.
          </p>
          <p className="mt-1 text-sm text-slate-400">
            Find an opportunity. Apply. Change your life. That&apos;s what this is all about.
          </p>
        </div>
      </div>
    </div>
  )
}
