<script>
  const posts = [
    { slug: 'getting-started', title: 'Getting Started', date: '2024-01-15', excerpt: 'How to set up your first SvelteKit project.' },
    { slug: 'reactivity', title: 'Understanding Reactivity', date: '2024-02-20', excerpt: 'How Svelte handles state changes.' },
    { slug: 'apis', title: 'Building APIs with SvelteKit', date: '2024-03-10', excerpt: 'Using server routes for REST endpoints.' },
  ];
</script>
<style>
  :global(body) { margin: 0; font-family: system-ui, sans-serif; }
  .container { max-width: 800px; margin: 0 auto; padding: 3rem 2rem; }
  article { padding: 2rem 0; border-bottom: 1px solid #eee; }
  time { color: #888; font-size: .875rem; }
  a { color: inherit; text-decoration: none; }
</style>
<div class="container">
  <h1 style="font-size:2.5rem;margin-bottom:2rem">Blog</h1>
  {#each posts as post}
    <article>
      <time>{post.date}</time>
      <h2><a href="/posts/{post.slug}">{post.title}</a></h2>
      <p style="color:#666">{post.excerpt}</p>
    </article>
  {/each}
</div>