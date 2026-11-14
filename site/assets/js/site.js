document.addEventListener('DOMContentLoaded', () => {
  const article = document.querySelector('.note-page .article-content');
  const toc = document.querySelector('.article-toc');
  if (article && toc) {
    const headings = [...article.querySelectorAll('h2[id], h3[id]')];
    if (headings.length > 2) {
      const list = document.createElement('ol');
      headings.forEach(heading => {
        const item = document.createElement('li');
        item.className = 'toc-level-' + heading.tagName.slice(1);
        const link = document.createElement('a');
        link.href = '#' + encodeURIComponent(heading.id);
        link.textContent = heading.textContent;
        item.append(link); list.append(item);
      });
      toc.querySelector('nav').append(list);
      toc.hidden = false;
    }
  }
});
