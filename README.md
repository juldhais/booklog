# Booklog

A simple, markdown-based blog app that displays a list of book posts and their contents.  
Each post is stored as a markdown (`.md`) file inside the `posts` folder and rendered dynamically on a separate page.

---

## Features

- List all posts with titles loaded from `posts.json`.
- View individual post content rendered from markdown.
- Responsive design using Bootstrap 5.
- Client-side search/filter on post titles.
- Automatically generate `posts.json` with post titles extracted from markdown files.
- Clean URLs using query parameters with encoded filenames.
- Footer with author info and dynamic current year.

---

## Project Structure

```
/
├── posts/                # Markdown files for each post (e.g. "My Book.md")
├── index.html            # Main page listing all posts with search
├── post.html             # Page to display individual post content
├── posts.json            # JSON file listing available posts (title + filename)
├── generate-posts-json.bat # Batch script to regenerate posts.json from markdown files
└── README.md             # This documentation file
```

---

## Setup & Usage

1. **Prepare your posts**

   - Add markdown files (`.md`) into the `posts` folder.
   - The first line of each markdown file should be the post title, starting optionally with `#`.  
     Example:
     ```markdown
     # My First Book Post
     Content goes here...
     ```

2. **Generate `posts.json`**

   Run the batch script to create/update the `posts.json` file with titles extracted from your markdown files:

   ```batch
   generate-posts-json.bat
   ```

3. **Serve or open `index.html`**

   - Open `index.html` in your browser to see the list of posts.
   - Use the search box to filter posts by title.
   - Click a post title to view its content on `post.html`.

---

## Development Notes

- The app uses [marked.js](https://marked.js.org/) for client-side Markdown-to-HTML rendering.
- Bootstrap 5 provides styling and responsive layout.
- Posts are linked via URL query parameters referencing the exact markdown filename (encoded).
- The `post.html` page fetches and renders the markdown dynamically.

---

## Author

Created by [Juldhais Hengkyawan](https://about.juldhais.net)

---

## License

This project is open source and available under the MIT License.
