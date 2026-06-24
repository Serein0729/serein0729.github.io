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
      { text: 'AI 安全', link: '/category/ai-security' },
      { text: '红队', link: '/category/red-team' },
      { text: '关于', link: '/about' },
    ],

    sidebar: {
      '/category/ai-security': [
        {
          text: 'LLM 安全',
          items: [
            { text: 'Prompt Injection', link: '/category/ai-security' },
          ],
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

    editLink: {
      pattern: 'https://github.com/Serein0729/serein0729.github.io/edit/main/docs/:path',
      text: '在 GitHub 上编辑此页',
    },
  },
})
