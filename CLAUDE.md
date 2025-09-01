# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

PageCompare is a web-based tool for visually comparing two web pages side-by-side using a draggable slider interface. The project is designed to bypass iframe restrictions by capturing screenshots of web pages through various API services or manual image uploads.

## Current Architecture

The project currently consists of a single HTML file that contains:
- **HTML Structure**: Complete page layout with input fields, comparison container, and controls
- **CSS Styling**: Embedded styles for the split-screen comparison interface, slider mechanics, and responsive design
- **JavaScript Functionality**: Client-side logic for image loading, slider interaction, and screenshot API integration

### Key Components

**HTML Structure:**
- URL input fields for both pages to compare
- API service selector dropdown
- File upload inputs for manual image loading
- Split-screen comparison container with draggable slider
- Labels and loading states

**Slider Mechanism:**
- Central draggable handle with visual indicators
- Mouse event handlers for smooth dragging
- Dynamic width adjustment of left/right containers
- Responsive design that maintains proportions

**Screenshot Integration:**
- Support for multiple API services (HTML/CSS to Image, ScreenshotOne, URL to Image)
- Placeholder system for development/testing
- Error handling for failed API calls
- Canvas-based placeholder generation

## Current State

The project is in early development stage with only the README.md containing the complete HTML implementation. There are no separate build tools, package management, or modular file structure yet.

## Development Approach

Since this is currently a single-file HTML application, development involves:

1. **Extracting Components**: Consider separating HTML, CSS, and JavaScript into individual files
2. **API Integration**: Implement actual screenshot service APIs with proper authentication
3. **Error Handling**: Enhance user experience with better error messages and fallbacks
4. **Performance**: Optimize image loading and comparison interface
5. **Testing**: Add unit tests for core functionality like slider mechanics

## Potential Development Commands

Currently no build system is set up. Future development might include:

```bash
# If extracting to separate files
# Development server
python3 -m http.server 8000

# If adding Node.js tooling
npm init
npm install --save-dev live-server
npm run serve

# If adding build process
npm run build
npm run dev
```

## Technical Considerations

**Screenshot API Integration:**
- Most services require API keys for production use
- Rate limiting considerations for API calls
- CORS handling for cross-origin requests
- Fallback mechanisms for service failures

**UI/UX Improvements:**
- Loading states during screenshot capture
- Progress indicators for long-running operations
- Mobile responsiveness optimization
- Keyboard navigation support

**Security:**
- API key management (environment variables)
- Input validation for URLs
- XSS prevention in dynamic content

## File Structure (Future)

The project could evolve to this structure:
```
pagecompare/
├── index.html
├── css/
│   ├── main.css
│   └── slider.css
├── js/
│   ├── slider.js
│   ├── screenshot-api.js
│   └── main.js
├── assets/
│   └── placeholders/
└── config/
    └── api-config.js
```