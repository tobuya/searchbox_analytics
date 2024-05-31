SearchTerm.destroy_all

SearchTerm.create([
  { term: 'Hello world, how are you?' },
  { term: 'How is Emil Hajric doing' },
  { term: 'What is a good car' },
  { term: 'Thomas here, would love to work at Helpjuice' },
  { term: 'Rails, PostgreSQL, and Vanilla JS.' }
])
