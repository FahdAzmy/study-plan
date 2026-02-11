import React from "react"
import type { Metadata, Viewport } from 'next'
import { Geist, Geist_Mono } from 'next/font/google'

import './globals.css'

const _geist = Geist({ subsets: ['latin'] })
const _geistMono = Geist_Mono({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'LLM Study Tracker | Feb 12 - Mar 31, 2026',
  description: 'Track your comprehensive LLM study journey with interactive calendar, progress tracking, and 250+ tasks across 7 weeks',
  generator: 'v0.app',
  keywords: ['study plan', 'LLM', 'learning', 'tracker', 'progress'],
  authors: [{ name: 'v0' }],
  openGraph: {
    title: 'LLM Study Tracker',
    description: 'Your comprehensive study journey from Feb 12 to Mar 31, 2026',
    type: 'website',
  },
}

export const viewport: Viewport = {
  width: 'device-width',
  initialScale: 1,
  themeColor: '#0f172a',
  colorScheme: 'dark',
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="en">
      <body className="font-sans antialiased">{children}</body>
    </html>
  )
}
