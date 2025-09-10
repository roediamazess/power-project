
'use strict';

// sidebar submenu collapsible js
document.querySelectorAll(".sidebar-menu .dropdown").forEach(function (dropdown) {
  dropdown.addEventListener("click", function () {
    var item = this;

    // Close all sibling dropdowns
    item.parentNode.querySelectorAll(".dropdown").forEach(function (sibling) {
      if (sibling !== item) {
        sibling.querySelector(".sidebar-submenu").style.display = 'none';
        sibling.classList.remove("dropdown-open");
        sibling.classList.remove("open");
      }
    });

    // Toggle the current dropdown
    var submenu = item.querySelector(".sidebar-submenu");
    submenu.style.display = (submenu.style.display === 'block') ? 'none' : 'block';

    item.classList.toggle("dropdown-open");
  });
});

// Toggle sidebar visibility and active class
const sidebarToggle = document.querySelector(".sidebar-toggle");
if(sidebarToggle) {
  sidebarToggle.addEventListener("click", function() {
    this.classList.toggle("active");
    document.querySelector(".sidebar").classList.toggle("active");
    document.querySelector(".dashboard-main").classList.toggle("active");
  });
}

// Open sidebar in mobile view and add overlay
const sidebarMobileToggle = document.querySelector(".sidebar-mobile-toggle");
if(sidebarMobileToggle) {
  sidebarMobileToggle.addEventListener("click", function() {
    document.querySelector(".sidebar").classList.add("sidebar-open");
    document.body.classList.add("overlay-active");
  });
}

// Close sidebar and remove overlay
const sidebarColseBtn = document.querySelector(".sidebar-close-btn");
if(sidebarColseBtn){
  sidebarColseBtn.addEventListener("click", function() {
    document.querySelector(".sidebar").classList.remove("sidebar-open");
    document.body.classList.remove("overlay-active");
  });
}

//to keep the current page active
document.addEventListener("DOMContentLoaded", function () {
  var nk = window.location.href;
  var links = document.querySelectorAll("ul#sidebar-menu a");

  links.forEach(function (link) {
    if (link.href === nk) {
      link.classList.add("active-page"); // anchor
      var parent = link.parentElement;
      parent.classList.add("active-page"); // li

      // Traverse up the DOM tree and add classes to parent elements
      while (parent && parent.tagName !== "BODY") {
        if (parent.tagName === "LI") {
          parent.classList.add("show");
          parent.classList.add("open");
        }
        parent = parent.parentElement;
      }
    }
  });
});




// On page load or when changing themes, best to add inline in `head` to avoid FOUC
if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
  document.documentElement.classList.add('dark');
} else {
  document.documentElement.classList.remove('dark')
}

// light dark version js
// Apply theme on page load
function applyTheme() {
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        document.documentElement.classList.add('dark');
    } else {
        document.documentElement.classList.remove('dark');
    }
}

// Apply theme immediately
applyTheme();

var themeToggleDarkIcon = document.getElementById('theme-toggle-dark-icon');
var themeToggleLightIcon = document.getElementById('theme-toggle-light-icon');

// Change the icons inside the button based on previous settings
if(themeToggleDarkIcon || themeToggleLightIcon){
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      themeToggleLightIcon.classList.remove('hidden');
  } else {
      themeToggleDarkIcon.classList.remove('hidden');
  }
}

var themeToggleBtn = document.getElementById('theme-toggle');

if(themeToggleDarkIcon || themeToggleLightIcon || themeToggleBtn){
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

// Initialize theme toggle for footer
function initFooterThemeToggle() {
    var themeToggleDarkIconFooter = document.getElementById('theme-toggle-dark-icon-footer');
    var themeToggleLightIconFooter = document.getElementById('theme-toggle-light-icon-footer');
    var themeToggleBtnFooter = document.getElementById('theme-toggle-footer');

    if (!themeToggleBtnFooter || !themeToggleDarkIconFooter || !themeToggleLightIconFooter) return;

    // Change the icons inside the button based on previous settings
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        themeToggleLightIconFooter.classList.remove('hidden');
    } else {
        themeToggleDarkIconFooter.classList.remove('hidden');
    }

    themeToggleBtnFooter.addEventListener('click', function() {
        console.log('Footer theme toggle clicked!');
        // toggle icons inside button
        themeToggleDarkIconFooter.classList.toggle('hidden');
        themeToggleLightIconFooter.classList.toggle('hidden');

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
        
        // Update navbar icons too
        updateNavbarIcons();
    });
}

// Update navbar icons based on current theme
function updateNavbarIcons() {
    var themeToggleDarkIcon = document.getElementById('theme-toggle-dark-icon');
    var themeToggleLightIcon = document.getElementById('theme-toggle-light-icon');
    
    if (themeToggleDarkIcon && themeToggleLightIcon) {
        if (localStorage.getItem('color-theme') === 'dark') {
            themeToggleLightIcon.classList.remove('hidden');
            themeToggleDarkIcon.classList.add('hidden');
        } else {
            themeToggleDarkIcon.classList.remove('hidden');
            themeToggleLightIcon.classList.add('hidden');
        }
    }
}

// Initialize footer theme toggle
console.log('Initializing footer theme toggle...');
initFooterThemeToggle();

// Apply theme on every page load
document.addEventListener('DOMContentLoaded', function() {
    applyTheme();
    updateNavbarIcons();
});

// Apply theme when page is fully loaded
window.addEventListener('load', function() {
    applyTheme();
    updateNavbarIcons();
});

// Debug: Check if JavaScript is loading
console.log('app.js loaded successfully');

// Keyboard navigation for Excel-like editing
document.addEventListener('keydown', function(e) {
    console.log('Key pressed:', e.key, 'Edit mode:', isEditMode);
    
    if (!isEditMode) {
        console.log('Edit mode is not active, ignoring key press');
        return;
    }
    
    // F2 to edit current field
    if (e.key === 'F2') {
        e.preventDefault();
        editCurrentField();
        return;
    }
    
    // Arrow keys for navigation
    if (e.key === 'ArrowRight') {
        e.preventDefault();
        moveToNextField();
    } else if (e.key === 'ArrowLeft') {
        e.preventDefault();
        moveToPreviousField();
    } else if (e.key === 'ArrowDown') {
        e.preventDefault();
        moveToNextRow();
    } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        moveToPreviousRow();
    }
    
    // Enter to save current field and move to next
    if (e.key === 'Enter') {
        e.preventDefault();
        saveCurrentField();
        moveToNextField();
    }
    
    // Escape to cancel edit
    if (e.key === 'Escape') {
        e.preventDefault();
        cancelCurrentEdit();
    }
    
    // Tab to move to next field
    if (e.key === 'Tab') {
        e.preventDefault();
        if (e.shiftKey) {
            moveToPreviousField();
        } else {
            moveToNextField();
        }
    }
});

// Edit Mode Functions for Tables
let isEditMode = false;
let editingUsers = new Set();
let currentRow = -1;
let currentField = -1;
let editableFields = ['full_name', 'password', 'tier', 'user_role', 'start_work', 'birthday'];

// Toggle edit mode for all users
function toggleEditMode() {
    console.log('toggleEditMode called');
    
    const editModeBtn = document.getElementById('edit-mode-btn');
    const saveAllBtn = document.getElementById('save-all-btn');
    const cancelAllBtn = document.getElementById('cancel-all-btn');
    
    console.log('Edit mode button found:', editModeBtn);
    
    if (!editModeBtn) {
        console.log('Edit mode button not found, exiting');
        return; // Exit if button doesn't exist
    }
    
    if (!isEditMode) {
        // Enter edit mode
        isEditMode = true;
        editModeBtn.innerHTML = '<i class="ri-close-line"></i> Exit Edit';
        editModeBtn.className = 'btn btn-warning btn-sm';
        if (saveAllBtn) saveAllBtn.style.display = 'inline-block';
        if (cancelAllBtn) cancelAllBtn.style.display = 'inline-block';
        
        // Show edit buttons for all rows
        document.querySelectorAll('.edit-btn').forEach(btn => {
            btn.style.display = 'inline-block';
        });
        
        // Enter edit mode for all users
        document.querySelectorAll('.user-row').forEach((row, index) => {
            editingUsers.add(index);
            const editFields = row.querySelectorAll('.edit-field');
            const displayFields = row.querySelectorAll('.display-field');
            
            displayFields.forEach(field => field.style.display = 'none');
            editFields.forEach(field => field.style.display = 'block');
            row.classList.add('editing');
        });
        
        // Set initial position
        currentRow = 0;
        currentField = 0;
        highlightCurrentField();
        
        console.log('Edit mode activated - Row:', currentRow, 'Field:', currentField);
        
        // Show keyboard instructions
        const instructions = document.getElementById('keyboard-instructions');
        if (instructions) instructions.style.display = 'block';
        
        console.log('Edit mode activated for all users');
        
    } else {
        // Exit edit mode
        isEditMode = false;
        editModeBtn.innerHTML = '<i class="ri-edit-line"></i> Edit Mode';
        editModeBtn.className = 'btn btn-primary btn-sm';
        if (saveAllBtn) saveAllBtn.style.display = 'none';
        if (cancelAllBtn) cancelAllBtn.style.display = 'none';
        
        // Hide edit buttons for all rows
        document.querySelectorAll('.edit-btn').forEach(btn => {
            btn.style.display = 'none';
        });
        
        // Exit edit mode for all users
        document.querySelectorAll('.user-row').forEach((row, index) => {
            editingUsers.delete(index);
            const editFields = row.querySelectorAll('.edit-field');
            const displayFields = row.querySelectorAll('.display-field');
            
            displayFields.forEach(field => field.style.display = 'block');
            editFields.forEach(field => field.style.display = 'none');
            row.classList.remove('editing');
        });
        
        // Reset position
        currentRow = -1;
        currentField = -1;
        removeAllHighlights();
        
        // Hide keyboard instructions
        const instructions = document.getElementById('keyboard-instructions');
        if (instructions) instructions.style.display = 'none';
        
        console.log('Edit mode deactivated');
    }
}

// Navigation functions
function moveToNextField() {
    if (currentField < editableFields.length - 1) {
        currentField++;
    } else {
        moveToNextRow();
        currentField = 0;
    }
    highlightCurrentField();
}

function moveToPreviousField() {
    if (currentField > 0) {
        currentField--;
    } else {
        moveToPreviousRow();
        currentField = editableFields.length - 1;
    }
    highlightCurrentField();
}

function moveToNextRow() {
    const totalRows = document.querySelectorAll('.user-row').length;
    if (currentRow < totalRows - 1) {
        currentRow++;
    } else {
        currentRow = 0;
    }
    highlightCurrentField();
}

function moveToPreviousRow() {
    const totalRows = document.querySelectorAll('.user-row').length;
    if (currentRow > 0) {
        currentRow--;
    } else {
        currentRow = totalRows - 1;
    }
    highlightCurrentField();
}

function highlightCurrentField() {
    console.log('highlightCurrentField called - Row:', currentRow, 'Field:', currentField);
    
    removeAllHighlights();
    
    if (currentRow >= 0 && currentField >= 0) {
        const row = document.getElementById(`user-row-${currentRow}`);
        console.log('Row found:', row);
        
        if (row) {
            const field = row.querySelector(`[data-field="${editableFields[currentField]}"]`);
            console.log('Field found:', field, 'Field name:', editableFields[currentField]);
            
            if (field) {
                field.classList.add('excel-highlight');
                field.focus();
                console.log('Field highlighted and focused');
            } else {
                console.log('Field not found for:', editableFields[currentField]);
            }
        } else {
            console.log('Row not found for index:', currentRow);
        }
    } else {
        console.log('Invalid position - Row:', currentRow, 'Field:', currentField);
    }
}

function removeAllHighlights() {
    document.querySelectorAll('.excel-highlight').forEach(el => {
        el.classList.remove('excel-highlight');
    });
}

function editCurrentField() {
    if (currentRow >= 0 && currentField >= 0) {
        const row = document.getElementById(`user-row-${currentRow}`);
        if (row) {
            const field = row.querySelector(`[data-field="${editableFields[currentField]}"]`);
            if (field) {
                field.focus();
                if (field.tagName === 'INPUT' || field.tagName === 'SELECT') {
                    field.select();
                }
            }
        }
    }
}

function saveCurrentField() {
    if (currentRow >= 0 && currentField >= 0) {
        const row = document.getElementById(`user-row-${currentRow}`);
        if (row) {
            const field = row.querySelector(`[data-field="${editableFields[currentField]}"]`);
            if (field) {
                // Update display field with new value
                const displayField = row.querySelector(`[data-field="${editableFields[currentField]}"].display-field`);
                if (displayField) {
                    if (editableFields[currentField] === 'tier') {
                        displayField.innerHTML = `<span class="badge bg-success-100 text-success-600 dark:bg-success-900 dark:text-success-400">${field.value}</span>`;
                    } else if (editableFields[currentField] === 'user_role') {
                        displayField.innerHTML = `<span class="badge bg-info-100 text-info-600 dark:bg-info-900 dark:text-info-400">${field.value}</span>`;
                    } else if (editableFields[currentField] === 'start_work' || editableFields[currentField] === 'birthday') {
                        displayField.textContent = field.value ? new Date(field.value).toLocaleDateString('en-GB') : '-';
                    } else {
                        displayField.textContent = field.value;
                    }
                }
            }
        }
    }
}

function cancelCurrentEdit() {
    if (currentRow >= 0 && currentField >= 0) {
        const row = document.getElementById(`user-row-${currentRow}`);
        if (row) {
            const field = row.querySelector(`[data-field="${editableFields[currentField]}"]`);
            const displayField = row.querySelector(`[data-field="${editableFields[currentField]}"].display-field`);
            
            if (field && displayField) {
                // Reset field value to original
                if (editableFields[currentField] === 'email') {
                    field.value = displayField.querySelector('a').textContent;
                } else if (editableFields[currentField] === 'tier' || editableFields[currentField] === 'user_role') {
                    field.value = displayField.textContent.trim();
                } else if (editableFields[currentField] === 'start_work' || editableFields[currentField] === 'birthday') {
                    const dateText = displayField.textContent;
                    if (dateText !== '-') {
                        const [day, month, year] = dateText.split('/');
                        field.value = `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`;
                    } else {
                        field.value = '';
                    }
                } else {
                    field.value = displayField.textContent;
                }
            }
        }
    }
}

// Save individual user
function saveUser(index) {
    const row = document.getElementById(`user-row-${index}`);
    if (!row) return;
    
    const editFields = row.querySelectorAll('.edit-field');
    const displayFields = row.querySelectorAll('.display-field');
    
    // Get user email from the row (assuming it's in a data attribute or can be found)
    const userEmail = row.querySelector('[data-field="email"] a')?.textContent || 
                     row.querySelector('.user-email')?.textContent;
    
    if (!userEmail) {
        showNotification('Error: User email not found!', 'error');
        return;
    }
    
    // Collect updated data
    const updatedData = {
        user_id: userEmail,
        full_name: '',
        password: '',
        tier: '',
        user_role: '',
        start_work: '',
        birthday: ''
    };
    
    editFields.forEach(field => {
        const fieldName = field.getAttribute('data-field');
        if (updatedData.hasOwnProperty(fieldName)) {
            updatedData[fieldName] = field.value;
        }
    });
    
    // Send update to server
    fetch('/api/update-user', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || ''
        },
        body: JSON.stringify(updatedData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Update display elements with new values
            displayFields.forEach(el => {
                const fieldName = el.getAttribute('data-field');
                if (fieldName === 'tier') {
                    el.innerHTML = `<span class="badge bg-success-100 text-success-600 dark:bg-success-900 dark:text-success-400">${updatedData[fieldName]}</span>`;
                } else if (fieldName === 'user_role') {
                    el.innerHTML = `<span class="badge bg-info-100 text-info-600 dark:bg-info-900 dark:text-info-400">${updatedData[fieldName]}</span>`;
                } else if (fieldName === 'start_work') {
                    el.textContent = updatedData[fieldName] ? new Date(updatedData[fieldName]).toLocaleDateString('en-GB') : '-';
                } else if (fieldName === 'birthday') {
                    el.textContent = updatedData[fieldName] ? new Date(updatedData[fieldName]).toLocaleDateString('en-GB') : '-';
                } else {
                    el.textContent = updatedData[fieldName];
                }
            });
            
            showNotification(data.message, 'success');
        } else {
            showNotification(data.message, 'error');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        showNotification('Error updating user: ' + error.message, 'error');
    });
}

// Cancel edit for individual user
function cancelEdit(index) {
    const row = document.getElementById(`user-row-${index}`);
    if (!row) return;
    
    const editFields = row.querySelectorAll('.edit-field');
    const displayFields = row.querySelectorAll('.display-field');
    
    // Reset edit fields to original values
    editFields.forEach(field => {
        const fieldName = field.getAttribute('data-field');
        const displayField = row.querySelector(`[data-field="${fieldName}"].display-field`);
        if (fieldName === 'email') {
            field.value = displayField.querySelector('a').textContent;
        } else if (fieldName === 'tier' || fieldName === 'user_role') {
            field.value = displayField.textContent.trim();
        } else if (fieldName === 'start_work' || fieldName === 'birthday') {
            const dateText = displayField.textContent;
            if (dateText !== '-') {
                const [day, month, year] = dateText.split('/');
                field.value = `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`;
            } else {
                field.value = '';
            }
        } else {
            field.value = displayField.textContent;
        }
    });
}

// Save all users
function saveAllUsers() {
    const users = [];
    
    editingUsers.forEach(index => {
        const row = document.getElementById(`user-row-${index}`);
        if (!row) return;
        
        const editFields = row.querySelectorAll('.edit-field');
        const userEmail = row.querySelector('[data-field="email"] a')?.textContent || 
                         row.querySelector('.user-email')?.textContent;
        
        if (!userEmail) return;
        
        const userData = {
            email: userEmail,
            full_name: '',
            password: '',
            tier: '',
            user_role: '',
            start_work: '',
            birthday: ''
        };
        
        editFields.forEach(field => {
            const fieldName = field.getAttribute('data-field');
            if (userData.hasOwnProperty(fieldName)) {
                userData[fieldName] = field.value;
            }
        });
        
        users.push(userData);
    });
    
    if (users.length === 0) {
        showNotification('No users to update!', 'warning');
        return;
    }
    
    // Send update to server
    fetch('/api/update-all-users', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || ''
        },
        body: JSON.stringify({ users: users })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Update display elements for all users
            editingUsers.forEach(index => {
                const row = document.getElementById(`user-row-${index}`);
                if (!row) return;
                
                const editFields = row.querySelectorAll('.edit-field');
                const displayFields = row.querySelectorAll('.display-field');
                
                // Update display elements with new values
                displayFields.forEach(el => {
                    const fieldName = el.getAttribute('data-field');
                    const field = row.querySelector(`[data-field="${fieldName}"].edit-field`);
                    if (field) {
                        if (fieldName === 'tier') {
                            el.innerHTML = `<span class="badge bg-success-100 text-success-600 dark:bg-success-900 dark:text-success-400">${field.value}</span>`;
                        } else if (fieldName === 'user_role') {
                            el.innerHTML = `<span class="badge bg-info-100 text-info-600 dark:bg-info-900 dark:text-info-400">${field.value}</span>`;
                        } else if (fieldName === 'start_work') {
                            el.textContent = field.value ? new Date(field.value).toLocaleDateString('en-GB') : '-';
                        } else if (fieldName === 'birthday') {
                            el.textContent = field.value ? new Date(field.value).toLocaleDateString('en-GB') : '-';
                        } else {
                            el.textContent = field.value;
                        }
                    }
                });
            });
            
            showNotification(data.message, 'success');
        } else {
            showNotification(data.message, 'error');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        showNotification('Error updating users: ' + error.message, 'error');
    });
}

// Cancel all edits
function cancelAllEdits() {
    editingUsers.forEach(index => {
        cancelEdit(index);
    });
    showNotification('All changes cancelled!', 'info');
}

// Show notification
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `alert alert-${type} alert-dismissible fade show position-fixed`;
    notification.style.cssText = 'top: 20px; right: 20px; z-index: 9999; min-width: 300px;';
    notification.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    `;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        if (notification.parentNode) {
            notification.parentNode.removeChild(notification);
        }
    }, 3000);
}