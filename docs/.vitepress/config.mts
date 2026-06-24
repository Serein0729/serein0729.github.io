import { defineConfig } from 'vitepress'

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

    sidebar: {
      // AI 安全分类
      '/posts/ai-security/': [
        {
          text: '🤖 AI 安全',
          items: [
            // 文章会自动出现在这里，按需添加
          ],
        },
      ],
      // 红队分类
      '/posts/red-team/': [
        {
          text: '⚔️ 红队',
          items: [],
        },
      ],
      // 传统安全分类
      '/posts/traditional-security/': [
        {
          text: '🛡️ 传统安全',
          items: [],
        },
      ],
    },

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
