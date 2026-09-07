(() => {
  document.querySelectorAll('[data-language]').forEach(link => {
    link.addEventListener('click', () => {
      link.hash = window.location.hash;
    });
  });
  const links = [...document.querySelectorAll('.site-nav a')];
  const sections = links.map(link => document.querySelector(link.hash)).filter(Boolean);
  const header = document.querySelector('.site-header');
  let pending = false;
  function updateActiveSection() {
    pending = false;
    const readingLine = (header ? header.getBoundingClientRect().bottom : 0) + 40;
    let active = sections[0];
    let closestTop = -Infinity;
    for (const section of sections) {
      const top = section.getBoundingClientRect().top;
      if (top > readingLine) continue;
      // Preserve an explicit anchor selection if section positions overlap.
      if (top > closestTop + 8 || (Math.abs(top - closestTop) <= 8 && window.location.hash === '#' + section.id)) {
        active = section;
        closestTop = top;
      }
    }
    if (window.scrollY + window.innerHeight >= document.documentElement.scrollHeight - 4) {
      active = sections[sections.length - 1];
    }
    if (!active) return;
    for (const link of links) {
      if (link.hash === '#' + active.id) link.setAttribute('aria-current', 'location');
      else link.removeAttribute('aria-current');
    }
  }
  function scheduleUpdate() {
    if (pending) return;
    pending = true;
    window.requestAnimationFrame(updateActiveSection);
  }
  window.addEventListener('scroll', scheduleUpdate, { passive: true });
  window.addEventListener('resize', scheduleUpdate);
  window.addEventListener('hashchange', scheduleUpdate);
  updateActiveSection();
})();
