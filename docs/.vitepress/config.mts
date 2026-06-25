import { defineConfig } from 'vitepress'
import fs from 'fs'
import path from 'path'

// 自动扫描 posts 目录生成侧边栏
function autoSidebar(postsDir: string) {
  const sidebar: Record<string, any[]> = {}
  const categories = fs.readdirSync(postsDir, { withFileTypes: true })
    .filter(d => d.isDirectory())

  for (const cat of categories) {
    const catDir = path.join(postsDir, cat.name)
    const files = fs.readdirSync(catDir)
      .filter(f => f.endsWith('.md') && f !== 'index.md')

    const items = files.map(f => ({
      text: f.replace('.md', ''),
      link: `/posts/${cat.name}/${f.replace('.md', '')}`,
    }))

    sidebar[`/posts/${cat.name}/`] = [{
      text: cat.name === 'ai-security' ? '🤖 AI 安全'
          : cat.name === 'red-team' ? '⚔️ 红队'
          : '🛡️ 传统安全',
      items,
    }]
  }

  return sidebar
}

const postsDir = path.resolve(__dirname, '../posts')

export default defineConfig({
  title: "V3ry0's Security Lab",
  description: 'AI × Security Researcher | Red Team Agent Builder',
  lang: 'zh-CN',

  head: [
    ['link', { rel: 'icon', href: '/favicon.ico' }],
  ],

  themeConfig: {
    nav: [
      { text: '首页', link: '/' },
      { text: 'AI 安全', link: '/posts/ai-security/' },
      { text: '红队', link: '/posts/red-team/' },
      { text: '传统安全', link: '/posts/traditional-security/' },
      { text: '关于', link: '/about' },
    ],

    sidebar: autoSidebar(postsDir),

    socialLinks: [
      { icon: 'github', link: 'https://github.com/Serein0729' },
    ],

    footer: {
      message: 'V3ry0 — 衍生自 vigil，寓意长久警醒',
    },

    search: {
      provider: 'local',
    },
  },
})
