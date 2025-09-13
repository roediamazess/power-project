window.addEventListener("DOMContentLoaded", () => {
  
  // Function to initialize theme toggle
  function initThemeToggle(buttonId, darkIconId, lightIconId) {
    var themeToggleDarkIcon = document.getElementById(darkIconId);
    var themeToggleLightIcon = document.getElementById(lightIconId);
    var themeToggleBtn = document.getElementById(buttonId);

    if (!themeToggleBtn || !themeToggleDarkIcon || !themeToggleLightIcon) return;

    // Change the icons inside the button based on previous settings
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        themeToggleLightIcon.classList.remove('hidden');
    } else {
        themeToggleDarkIcon.classList.remove('hidden');
    }

    themeToggleBtn.addEventListener('click', function() {
        // toggle icons inside button
        themeToggleDarkIcon.classList.toggle('hidden');
        themeToggleLightIcon.classList.toggle('hidden');

        // if set via local storage previously
        if (localStorage.getItem('color-theme')) {
            if (localStorage.getItem('color-theme') === 'light') {
                document.documentElement.classList.add('dark');
                localStorage.setItem('color-theme', 'dark');
            } else {
                document.documentElement.classList.remove('dark');
                localStorage.setItem('color-theme', 'light');
            }

        // if NOT set via local storage previously
        } else {
            if (document.documentElement.classList.contains('dark')) {
                document.documentElement.classList.remove('dark');
                localStorage.setItem('color-theme', 'light');
            } else {
                document.documentElement.classList.add('dark');
                localStorage.setItem('color-theme', 'dark');
            }
        }
    });
  }

  // Initialize theme toggles
  initThemeToggle('theme-toggle', 'theme-toggle-dark-icon', 'theme-toggle-light-icon');
  initThemeToggle('theme-toggle-footer', 'theme-toggle-dark-icon-footer', 'theme-toggle-light-icon-footer');
});
