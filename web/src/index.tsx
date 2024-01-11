import React from 'react'
import ReactDOM from 'react-dom/client'
import './index.css'
import { VisibilityProvider } from "./providers/VisibilityProvider";
import { ThemeProvider } from "@material-tailwind/react";
import App from "./components/App";

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode> 
    <VisibilityProvider>
    <ThemeProvider>
      <App />
      </ThemeProvider>
    </VisibilityProvider>
  </React.StrictMode>
)
