import { QuartzConfig } from "./quartz/cfg"

const config: QuartzConfig = {
  configuration: {
    pageTitle: "V3ry0's Security Lab",
    enableSPA: true,
    enablePopovers: true,
    dateFormat: "yyyy-MM-dd",
    baseUrl: "v3ry0.github.io",
    ignorePatterns: ["README.md"],
    defaultDateType: "created",
  },
  plugins: {
    transformers: {
      frontmatter: {},
      latex: {},
      syntaxHighlighting: {},
      obsidianFlavoredMarkdown: {},
      gfm: {},
      oxHugoFlavoredMarkdown: {},
      custody: {},
    },
    filters: {
      draft: {},
      explicitPublish: {},
    },
    emitters: {
      contentIndex: { enableSiteSearch: true },
      aliases: {},
      assets: {},
      static: {},
      componentResources: {},
      content: {},
      folderContent: {},
      tagContent: {},
      index: {},
      404: {},
    },
  },
}

export default config
