#!/bin/bash
set -e
cd /app
mkdir -p .quartz/plugins
echo "Cloning alias-redirects..."
git clone --depth 1 "https://github.com/quartz-community/alias-redirects.git" ".quartz/plugins/alias-redirects" 2>/dev/null
cd ".quartz/plugins/alias-redirects" && git fetch --depth 1 origin c46bc82fb9c93612902de6ab6880d28d7789b471 && git checkout c46bc82fb9c93612902de6ab6880d28d7789b471 2>/dev/null
cd /app
echo "Cloning article-title..."
git clone --depth 1 "https://github.com/quartz-community/article-title.git" ".quartz/plugins/article-title" 2>/dev/null
cd ".quartz/plugins/article-title" && git fetch --depth 1 origin 5c5f7c702c4f56c95cee881d5440ec21a8970ba8 && git checkout 5c5f7c702c4f56c95cee881d5440ec21a8970ba8 2>/dev/null
cd /app
echo "Cloning backlinks..."
git clone --depth 1 "https://github.com/quartz-community/backlinks.git" ".quartz/plugins/backlinks" 2>/dev/null
cd ".quartz/plugins/backlinks" && git fetch --depth 1 origin 51c8954108ec68a0293dc7924af703ae59c78f5a && git checkout 51c8954108ec68a0293dc7924af703ae59c78f5a 2>/dev/null
cd /app
echo "Cloning bases-page..."
git clone --depth 1 "https://github.com/quartz-community/bases-page.git" ".quartz/plugins/bases-page" 2>/dev/null
cd ".quartz/plugins/bases-page" && git fetch --depth 1 origin ec5711f91e40b1e8477a101f6e2604926e4f0222 && git checkout ec5711f91e40b1e8477a101f6e2604926e4f0222 2>/dev/null
cd /app
echo "Cloning breadcrumbs..."
git clone --depth 1 "https://github.com/quartz-community/breadcrumbs.git" ".quartz/plugins/breadcrumbs" 2>/dev/null
cd ".quartz/plugins/breadcrumbs" && git fetch --depth 1 origin 2f7ec9a7ef80ad5128d18205548f1132a2cf150a && git checkout 2f7ec9a7ef80ad5128d18205548f1132a2cf150a 2>/dev/null
cd /app
echo "Cloning canvas-page..."
git clone --depth 1 "https://github.com/quartz-community/canvas-page.git" ".quartz/plugins/canvas-page" 2>/dev/null
cd ".quartz/plugins/canvas-page" && git fetch --depth 1 origin 2e6d05ce087cf9b6de4dc9fa72590a3047170daa && git checkout 2e6d05ce087cf9b6de4dc9fa72590a3047170daa 2>/dev/null
cd /app
echo "Cloning citations..."
git clone --depth 1 "https://github.com/quartz-community/citations.git" ".quartz/plugins/citations" 2>/dev/null
cd ".quartz/plugins/citations" && git fetch --depth 1 origin 2ad133a123c5b15b7c41d4fb684d422622113081 && git checkout 2ad133a123c5b15b7c41d4fb684d422622113081 2>/dev/null
cd /app
echo "Cloning cname..."
git clone --depth 1 "https://github.com/quartz-community/cname.git" ".quartz/plugins/cname" 2>/dev/null
cd ".quartz/plugins/cname" && git fetch --depth 1 origin ec4c81c91da13a6f6c2cbe1656daf5c14575dab3 && git checkout ec4c81c91da13a6f6c2cbe1656daf5c14575dab3 2>/dev/null
cd /app
echo "Cloning comments..."
git clone --depth 1 "https://github.com/quartz-community/comments.git" ".quartz/plugins/comments" 2>/dev/null
cd ".quartz/plugins/comments" && git fetch --depth 1 origin 278115200a9bacfc0ee4695b200a5843d15517f3 && git checkout 278115200a9bacfc0ee4695b200a5843d15517f3 2>/dev/null
cd /app
echo "Cloning content-index..."
git clone --depth 1 "https://github.com/quartz-community/content-index.git" ".quartz/plugins/content-index" 2>/dev/null
cd ".quartz/plugins/content-index" && git fetch --depth 1 origin 34621a71940977a6af6b20abd5dc552d81181b6b && git checkout 34621a71940977a6af6b20abd5dc552d81181b6b 2>/dev/null
cd /app
echo "Cloning content-meta..."
git clone --depth 1 "https://github.com/quartz-community/content-meta.git" ".quartz/plugins/content-meta" 2>/dev/null
cd ".quartz/plugins/content-meta" && git fetch --depth 1 origin a148b4104e9fb6323a6459b2f13c46f9a92da487 && git checkout a148b4104e9fb6323a6459b2f13c46f9a92da487 2>/dev/null
cd /app
echo "Cloning content-page..."
git clone --depth 1 "https://github.com/quartz-community/content-page.git" ".quartz/plugins/content-page" 2>/dev/null
cd ".quartz/plugins/content-page" && git fetch --depth 1 origin 977d15f083f5b5de4b299c8f016e4e61fd422716 && git checkout 977d15f083f5b5de4b299c8f016e4e61fd422716 2>/dev/null
cd /app
echo "Cloning crawl-links..."
git clone --depth 1 "https://github.com/quartz-community/crawl-links.git" ".quartz/plugins/crawl-links" 2>/dev/null
cd ".quartz/plugins/crawl-links" && git fetch --depth 1 origin 69497e22046d62ee601415ad832bcde89a70a544 && git checkout 69497e22046d62ee601415ad832bcde89a70a544 2>/dev/null
cd /app
echo "Cloning created-modified-date..."
git clone --depth 1 "https://github.com/quartz-community/created-modified-date.git" ".quartz/plugins/created-modified-date" 2>/dev/null
cd ".quartz/plugins/created-modified-date" && git fetch --depth 1 origin c003199fb842969d43ee9e0f54120a85e588260e && git checkout c003199fb842969d43ee9e0f54120a85e588260e 2>/dev/null
cd /app
echo "Cloning darkmode..."
git clone --depth 1 "https://github.com/quartz-community/darkmode.git" ".quartz/plugins/darkmode" 2>/dev/null
cd ".quartz/plugins/darkmode" && git fetch --depth 1 origin dedd9606147e9d995a4376b0d03e469e39e94f85 && git checkout dedd9606147e9d995a4376b0d03e469e39e94f85 2>/dev/null
cd /app
echo "Cloning description..."
git clone --depth 1 "https://github.com/quartz-community/description.git" ".quartz/plugins/description" 2>/dev/null
cd ".quartz/plugins/description" && git fetch --depth 1 origin 026e63bd46d5f7feed58373f999ed98bf8248a26 && git checkout 026e63bd46d5f7feed58373f999ed98bf8248a26 2>/dev/null
cd /app
echo "Cloning encrypted-pages..."
git clone --depth 1 "https://github.com/quartz-community/encrypted-pages.git" ".quartz/plugins/encrypted-pages" 2>/dev/null
cd ".quartz/plugins/encrypted-pages" && git fetch --depth 1 origin e0e08e7afa40b97909fb24fd7509ddaa10116425 && git checkout e0e08e7afa40b97909fb24fd7509ddaa10116425 2>/dev/null
cd /app
echo "Cloning explicit-publish..."
git clone --depth 1 "https://github.com/quartz-community/explicit-publish.git" ".quartz/plugins/explicit-publish" 2>/dev/null
cd ".quartz/plugins/explicit-publish" && git fetch --depth 1 origin 4afb630a1cc9034267beb93c928e81d0fa2f4d4b && git checkout 4afb630a1cc9034267beb93c928e81d0fa2f4d4b 2>/dev/null
cd /app
echo "Cloning explorer..."
git clone --depth 1 "https://github.com/quartz-community/explorer.git" ".quartz/plugins/explorer" 2>/dev/null
cd ".quartz/plugins/explorer" && git fetch --depth 1 origin 69389c917af8f8c74372c70b600ef4652f20c8f2 && git checkout 69389c917af8f8c74372c70b600ef4652f20c8f2 2>/dev/null
cd /app
echo "Cloning favicon..."
git clone --depth 1 "https://github.com/quartz-community/favicon.git" ".quartz/plugins/favicon" 2>/dev/null
cd ".quartz/plugins/favicon" && git fetch --depth 1 origin 85842d5c15f937a3d1a02c45accee27118146d73 && git checkout 85842d5c15f937a3d1a02c45accee27118146d73 2>/dev/null
cd /app
echo "Cloning folder-page..."
git clone --depth 1 "https://github.com/quartz-community/folder-page.git" ".quartz/plugins/folder-page" 2>/dev/null
cd ".quartz/plugins/folder-page" && git fetch --depth 1 origin a538b8e548a0215568942a3d94b042010a86d66b && git checkout a538b8e548a0215568942a3d94b042010a86d66b 2>/dev/null
cd /app
echo "Cloning footer..."
git clone --depth 1 "https://github.com/quartz-community/footer.git" ".quartz/plugins/footer" 2>/dev/null
cd ".quartz/plugins/footer" && git fetch --depth 1 origin 9e3f6d734d886eac0d41841c4dc8862b377fcaf4 && git checkout 9e3f6d734d886eac0d41841c4dc8862b377fcaf4 2>/dev/null
cd /app
echo "Cloning github-flavored-markdown..."
git clone --depth 1 "https://github.com/quartz-community/github-flavored-markdown.git" ".quartz/plugins/github-flavored-markdown" 2>/dev/null
cd ".quartz/plugins/github-flavored-markdown" && git fetch --depth 1 origin 3eabbaa252ce175665ab3f62e1af25948a83e8b6 && git checkout 3eabbaa252ce175665ab3f62e1af25948a83e8b6 2>/dev/null
cd /app
echo "Cloning graph..."
git clone --depth 1 "https://github.com/quartz-community/graph.git" ".quartz/plugins/graph" 2>/dev/null
cd ".quartz/plugins/graph" && git fetch --depth 1 origin 67ac4993907618a0ea5bd33726f792c572cddbad && git checkout 67ac4993907618a0ea5bd33726f792c572cddbad 2>/dev/null
cd /app
echo "Cloning hard-line-breaks..."
git clone --depth 1 "https://github.com/quartz-community/hard-line-breaks.git" ".quartz/plugins/hard-line-breaks" 2>/dev/null
cd ".quartz/plugins/hard-line-breaks" && git fetch --depth 1 origin 0d448f38a24c568c5539ff2cd57d813293430ccd && git checkout 0d448f38a24c568c5539ff2cd57d813293430ccd 2>/dev/null
cd /app
echo "Cloning latex..."
git clone --depth 1 "https://github.com/quartz-community/latex.git" ".quartz/plugins/latex" 2>/dev/null
cd ".quartz/plugins/latex" && git fetch --depth 1 origin 3dcfedcb5ae5e28b71248a72665ccb881e82c185 && git checkout 3dcfedcb5ae5e28b71248a72665ccb881e82c185 2>/dev/null
cd /app
echo "Cloning note-properties..."
git clone --depth 1 "https://github.com/quartz-community/note-properties.git" ".quartz/plugins/note-properties" 2>/dev/null
cd ".quartz/plugins/note-properties" && git fetch --depth 1 origin 874712a9910299b906606c885ea1fe9602114ca7 && git checkout 874712a9910299b906606c885ea1fe9602114ca7 2>/dev/null
cd /app
echo "Cloning obsidian-flavored-markdown..."
git clone --depth 1 "https://github.com/quartz-community/obsidian-flavored-markdown.git" ".quartz/plugins/obsidian-flavored-markdown" 2>/dev/null
cd ".quartz/plugins/obsidian-flavored-markdown" && git fetch --depth 1 origin 7f61d4bcf7537d056528f6cecaf5c35b39f74fe8 && git checkout 7f61d4bcf7537d056528f6cecaf5c35b39f74fe8 2>/dev/null
cd /app
echo "Cloning og-image..."
git clone --depth 1 "https://github.com/quartz-community/og-image.git" ".quartz/plugins/og-image" 2>/dev/null
cd ".quartz/plugins/og-image" && git fetch --depth 1 origin 52ea59e2b40dde77abf7fd88eddecf161e671085 && git checkout 52ea59e2b40dde77abf7fd88eddecf161e671085 2>/dev/null
cd /app
echo "Cloning ox-hugo..."
git clone --depth 1 "https://github.com/quartz-community/ox-hugo.git" ".quartz/plugins/ox-hugo" 2>/dev/null
cd ".quartz/plugins/ox-hugo" && git fetch --depth 1 origin 832871da9ab33d52f904456c1a5e14f1b2057d83 && git checkout 832871da9ab33d52f904456c1a5e14f1b2057d83 2>/dev/null
cd /app
echo "Cloning page-title..."
git clone --depth 1 "https://github.com/quartz-community/page-title.git" ".quartz/plugins/page-title" 2>/dev/null
cd ".quartz/plugins/page-title" && git fetch --depth 1 origin a53cf02ce7faca400bcf3cfeed47eb860329e534 && git checkout a53cf02ce7faca400bcf3cfeed47eb860329e534 2>/dev/null
cd /app
echo "Cloning reader-mode..."
git clone --depth 1 "https://github.com/quartz-community/reader-mode.git" ".quartz/plugins/reader-mode" 2>/dev/null
cd ".quartz/plugins/reader-mode" && git fetch --depth 1 origin 02e36d3720e10c2087abce23cf0d2e94d53d27f1 && git checkout 02e36d3720e10c2087abce23cf0d2e94d53d27f1 2>/dev/null
cd /app
echo "Cloning recent-notes..."
git clone --depth 1 "https://github.com/quartz-community/recent-notes.git" ".quartz/plugins/recent-notes" 2>/dev/null
cd ".quartz/plugins/recent-notes" && git fetch --depth 1 origin 4505adba9c213967ddf94ea5fc05039245fd9fe9 && git checkout 4505adba9c213967ddf94ea5fc05039245fd9fe9 2>/dev/null
cd /app
echo "Cloning remove-draft..."
git clone --depth 1 "https://github.com/quartz-community/remove-draft.git" ".quartz/plugins/remove-draft" 2>/dev/null
cd ".quartz/plugins/remove-draft" && git fetch --depth 1 origin 0a51a4c6abb3c86961a9bbf46f4538da87fcf9f8 && git checkout 0a51a4c6abb3c86961a9bbf46f4538da87fcf9f8 2>/dev/null
cd /app
echo "Cloning roam..."
git clone --depth 1 "https://github.com/quartz-community/roam.git" ".quartz/plugins/roam" 2>/dev/null
cd ".quartz/plugins/roam" && git fetch --depth 1 origin b2aad70fdf548d07b8fd28df9edbdba7f256f166 && git checkout b2aad70fdf548d07b8fd28df9edbdba7f256f166 2>/dev/null
cd /app
echo "Cloning search..."
git clone --depth 1 "https://github.com/quartz-community/search.git" ".quartz/plugins/search" 2>/dev/null
cd ".quartz/plugins/search" && git fetch --depth 1 origin e0ebef9f80b23a015a9252d4ab98b889b08dc8b7 && git checkout e0ebef9f80b23a015a9252d4ab98b889b08dc8b7 2>/dev/null
cd /app
echo "Cloning spacer..."
git clone --depth 1 "https://github.com/quartz-community/spacer.git" ".quartz/plugins/spacer" 2>/dev/null
cd ".quartz/plugins/spacer" && git fetch --depth 1 origin 64b135dcfb78c4911f8c42d942872d645cd2a456 && git checkout 64b135dcfb78c4911f8c42d942872d645cd2a456 2>/dev/null
cd /app
echo "Cloning stacked-pages..."
git clone --depth 1 "https://github.com/quartz-community/stacked-pages.git" ".quartz/plugins/stacked-pages" 2>/dev/null
cd ".quartz/plugins/stacked-pages" && git fetch --depth 1 origin 9d67b8dedab5c27db98afd26dfa773e5003b0446 && git checkout 9d67b8dedab5c27db98afd26dfa773e5003b0446 2>/dev/null
cd /app
echo "Cloning syntax-highlighting..."
git clone --depth 1 "https://github.com/quartz-community/syntax-highlighting.git" ".quartz/plugins/syntax-highlighting" 2>/dev/null
cd ".quartz/plugins/syntax-highlighting" && git fetch --depth 1 origin 5bfdc2c3f42d3d0326c4e777eb575f3fb68d51fb && git checkout 5bfdc2c3f42d3d0326c4e777eb575f3fb68d51fb 2>/dev/null
cd /app
echo "Cloning table-of-contents..."
git clone --depth 1 "https://github.com/quartz-community/table-of-contents.git" ".quartz/plugins/table-of-contents" 2>/dev/null
cd ".quartz/plugins/table-of-contents" && git fetch --depth 1 origin 4c25c048a7f788cb156dad0050d80c7ed88692f9 && git checkout 4c25c048a7f788cb156dad0050d80c7ed88692f9 2>/dev/null
cd /app
echo "Cloning tag-list..."
git clone --depth 1 "https://github.com/quartz-community/tag-list.git" ".quartz/plugins/tag-list" 2>/dev/null
cd ".quartz/plugins/tag-list" && git fetch --depth 1 origin 0d18b40d26b3499823d46740c35e8ee874ba0ca0 && git checkout 0d18b40d26b3499823d46740c35e8ee874ba0ca0 2>/dev/null
cd /app
echo "Cloning tag-page..."
git clone --depth 1 "https://github.com/quartz-community/tag-page.git" ".quartz/plugins/tag-page" 2>/dev/null
cd ".quartz/plugins/tag-page" && git fetch --depth 1 origin 82f8a6d5e774de5e075978651b6ca81f2ccb6812 && git checkout 82f8a6d5e774de5e075978651b6ca81f2ccb6812 2>/dev/null
cd /app
echo "Cloning unlisted-pages..."
git clone --depth 1 "https://github.com/quartz-community/unlisted-pages.git" ".quartz/plugins/unlisted-pages" 2>/dev/null
cd ".quartz/plugins/unlisted-pages" && git fetch --depth 1 origin be42781fb08a60e9f9268682d457b289094d2838 && git checkout be42781fb08a60e9f9268682d457b289094d2838 2>/dev/null
cd /app