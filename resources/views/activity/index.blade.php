@extends('layout.layout')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card border-0 overflow-hidden">
                <div class="card-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="card-title text-lg mb-0">Activity Management</h5>
                            <p class="text-sm text-neutral-500 dark:text-neutral-400">Manage project activities with Excel-like editing</p>
                        </div>
                    </div>
                </div>

                <!-- Instructions -->
                <div class="p-4 bg-light border-bottom">
                    <p class="text-sm text-muted mb-0">
                        <b>Aksi:</b> Edit (Enter/F2), Hapus (Del), Modal (Ctrl+Klik). | <b>Simpan:</b> Enter/Tab.<br>
                        <b>Catatan:</b> CNC Number & Project ID dapat diedit melalui Modal (Ctrl+Klik).
                    </p>
                </div>

                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0" id="activity-table">
                            <thead class="table-light dark:bg-gray-800 dark:border-gray-700">
                                <tr>
                                    <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider w-10">No</th>
                                    <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider w-16">Info Date</th>
                                    <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider w-32">User & Position</th>
                                    <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider w-20">Department</th>
                                    <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider w-20">Application</th>
                                    <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider w-16">Type</th>
                                    <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider w-64">Description</th>
                                    <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider w-64">Action / Solution</th>
                                    <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider w-16">Status</th>
                                    <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider w-16">Due Date</th>
                                </tr>
                            </thead>
                            <tbody id="data-table-body" class="divide-y divide-gray-200 dark:divide-gray-700">
                                <!-- Data akan dimasukkan oleh JavaScript -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal Edit -->
<div id="edit-modal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden flex items-center justify-center dark:bg-gray-900 dark:bg-opacity-70" style="z-index: 9999;">
    <div class="relative mx-auto p-4 border w-full max-w-4xl shadow-lg rounded-md bg-white dark:bg-gray-800 dark:border-gray-600">
        <div class="flex justify-between items-center pb-3 border-b dark:border-gray-600">
            <p class="text-2xl font-bold text-gray-900 dark:text-white">Edit Detail Tugas</p>
            <button id="close-modal-btn" class="cursor-pointer z-50">
                <svg class="fill-current text-black dark:text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18"><path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path></svg>
            </button>
        </div>
        <div class="mt-5 max-h-96 overflow-y-auto">
            <form id="edit-form">
                <input type="hidden" id="modal-row-index">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="mb-4">
                        <label for="modal-activity-id" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">Activity ID</label>
                        <input type="text" id="modal-activity-id" readonly class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-500 dark:text-gray-400 dark:bg-gray-600 dark:border-gray-500 leading-tight bg-gray-100 dark:bg-gray-600">
                    </div>
                    <div class="mb-4">
                        <label for="modal-project-id" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">Project ID</label>
                        <input type="text" id="modal-project-id" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400">
                    </div>
                    <div class="mb-4">
                        <label for="modal-no" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">No</label>
                        <input type="number" id="modal-no" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400">
                    </div>
                    <div class="mb-4">
                        <label for="modal-information-date" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">Information Date</label>
                        <input type="date" id="modal-information-date" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400">
                    </div>
                    <div class="mb-4">
                        <label for="modal-user-position" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">User & Position</label>
                        <input type="text" id="modal-user-position" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400">
                    </div>
                    <div class="mb-4">
                        <label for="modal-department" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">Department</label>
                        <select id="modal-department" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400">
                            <option value="Food & Beverage">Food & Beverage</option>
                            <option value="Kitchen">Kitchen</option>
                            <option value="Room Division">Room Division</option>
                            <option value="Front Office">Front Office</option>
                            <option value="Housekeeping">Housekeeping</option>
                            <option value="Engineering">Engineering</option>
                            <option value="Sales & Marketing">Sales & Marketing</option>
                            <option value="IT / EDP">IT / EDP</option>
                            <option value="Accounting">Accounting</option>
                            <option value="Executive Office">Executive Office</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="modal-application" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">Application</label>
                        <select id="modal-application" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400">
                            <option value="Power FO">Power FO</option>
                            <option value="My POS">My POS</option>
                            <option value="My MGR">My MGR</option>
                            <option value="Power AR">Power AR</option>
                            <option value="Power INV">Power INV</option>
                            <option value="Power AP">Power AP</option>
                            <option value="Power GL">Power GL</option>
                            <option value="Keylock">Keylock</option>
                            <option value="PABX">PABX</option>
                            <option value="DIM">DIM</option>
                            <option value="Dynamic Room Rate">Dynamic Room Rate</option>
                            <option value="Channel Manager">Channel Manager</option>
                            <option value="PB1">PB1</option>
                            <option value="Power SIGN">Power SIGN</option>
                            <option value="Multi Properties">Multi Properties</option>
                            <option value="Scanner ID">Scanner ID</option>
                            <option value="IPOS">IPOS</option>
                            <option value="Power Runner">Power Runner</option>
                            <option value="Power RA">Power RA</option>
                            <option value="Power ME">Power ME</option>
                            <option value="ECOS">ECOS</option>
                            <option value="Cloud WS">Cloud WS</option>
                            <option value="Power GO">Power GO</option>
                            <option value="Dashpad">Dashpad</option>
                            <option value="IPTV">IPTV</option>
                            <option value="HSIA">HSIA</option>
                            <option value="SGI">SGI</option>
                            <option value="Guest Survey">Guest Survey</option>
                            <option value="Loyalty Management">Loyalty Management</option>
                            <option value="AccPac">AccPac</option>
                            <option value="GL Consolidation">GL Consolidation</option>
                            <option value="Self Check In">Self Check In</option>
                            <option value="Check In Desk">Check In Desk</option>
                            <option value="Others">Others</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="modal-type" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">Type</label>
                        <select id="modal-type" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400">
                            <option value="Setup">Setup</option>
                            <option value="Question">Question</option>
                            <option value="Issue">Issue</option>
                            <option value="Report Issue">Report Issue</option>
                            <option value="Report Request">Report Request</option>
                            <option value="Feature Request">Feature Request</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="modal-due-date" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">Due Date</label>
                        <input type="date" id="modal-due-date" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400">
                    </div>
                    <div class="mb-4">
                        <label for="modal-status" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">Status</label>
                        <select id="modal-status" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400">
                            <option value="Open">Open</option>
                            <option value="On Progress">On Progress</option>
                            <option value="Need Requirement">Need Requirement</option>
                            <option value="Done">Done</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="modal-cnc-number" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">CNC Number</label>
                        <input type="text" id="modal-cnc-number" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400">
                    </div>
                </div>
                <div class="mb-4">
                    <label for="modal-description" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">Description</label>
                    <textarea id="modal-description" rows="3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400"></textarea>
                </div>
                <div class="mb-6">
                    <label for="modal-action-solution" class="block text-gray-700 dark:text-gray-300 text-sm font-bold mb-2">Action / Solution</label>
                    <textarea id="modal-action-solution" rows="3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 dark:text-gray-200 dark:bg-gray-700 dark:border-gray-600 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400"></textarea>
                </div>
                <div class="flex items-center justify-end gap-3">
                    <button id="cancel-modal-btn" type="button" class="bg-gray-200 hover:bg-gray-300 dark:bg-gray-600 dark:hover:bg-gray-500 text-gray-800 dark:text-gray-200 font-bold py-2 px-4 rounded focus:outline-none">
                        Batal
                    </button>
                    <button id="save-modal-btn" type="submit" class="bg-blue-500 hover:bg-blue-700 dark:bg-blue-600 dark:hover:bg-blue-500 text-white font-bold py-2 px-4 rounded focus:outline-none">
                        Simpan Perubahan
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Konfirmasi Hapus -->
<div id="confirm-delete-modal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden flex items-center justify-center dark:bg-gray-900 dark:bg-opacity-70" style="z-index: 9999;">
    <div class="relative mx-auto p-4 border w-72 shadow-lg rounded-md bg-white dark:bg-gray-800 dark:border-gray-600">
        <div class="mt-3 text-center">
            <div class="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-red-100 dark:bg-red-900">
                <svg class="h-6 w-6 text-red-600 dark:text-red-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
            </div>
            <h3 class="text-lg leading-6 font-medium text-gray-900 dark:text-white mt-2">Hapus Baris</h3>
            <div class="mt-2 px-7 py-3">
                <p class="text-sm text-gray-500 dark:text-gray-400">
                    Yakin hapus? (<b>Y</b>/<b>N</b>)
                </p>
            </div>
            <div class="items-center px-4 py-3 gap-3 flex justify-center">
                <button id="cancel-delete-btn" class="px-4 py-2 bg-gray-200 dark:bg-gray-600 text-gray-800 dark:text-gray-200 rounded-md hover:bg-gray-300 dark:hover:bg-gray-500 focus:outline-none">
                    Batal (N)
                </button>
                <button id="confirm-delete-btn" class="px-4 py-2 bg-red-500 dark:bg-red-600 text-white rounded-md hover:bg-red-600 dark:hover:bg-red-500 focus:outline-none">
                    Ya, Hapus (Y)
                </button>
            </div>
        </div>
    </div>
</div>

@endsection

@push('styles')
<style>
    /* Style untuk sel yang sedang dipilih */
    .selected-cell {
        outline: 2px solid #2563eb !important;
        outline-offset: -2px;
        background-color: #dbeafe !important;
    }

    .dark .selected-cell {
        outline: 2px solid #60a5fa !important;
        background-color: #1e3a8a !important;
    }

    /* Style untuk sel yang sedang diedit */
    .editing-cell {
        padding: 0 !important;
    }

    .editing-cell input,
    .editing-cell select,
    .editing-cell textarea {
        width: 100%;
        border: none;
        outline: none;
        padding: 0.75rem 1rem;
        box-sizing: border-box;
        background: white;
        font-size: 0.875rem;
        line-height: 1.25rem;
        color: #111827;
    }

    .editing-cell textarea {
        resize: vertical;
        min-height: 60px;
        height: auto;
    }

    .dark .editing-cell input,
    .dark .editing-cell select,
    .dark .editing-cell textarea {
        background: #374151;
        color: white;
    }

    /* Style untuk tombol modal yang fokus */
    .modal-button-focus {
        box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.4);
        outline: 2px solid #3b82f6;
        outline-offset: 1px;
    }

    /* Dark mode modal button focus */
    .dark .modal-button-focus {
        box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.6);
        outline: 2px solid #60a5fa;
    }

    .table-cell {
        cursor: pointer;
        user-select: none;
    }

    .table-cell:hover {
        background-color: #f8fafc;
    }

    .dark .table-cell:hover {
        background-color: #374151;
    }

    /* Override Bootstrap modal z-index for proper layering */
    #edit-modal, #confirm-delete-modal {
        z-index: 1055;
    }

    /* Explicit modal width overrides */
    #edit-modal .relative {
        width: 896px !important;
        max-width: 896px !important;
    }

    #confirm-delete-modal .relative {
        width: 288px !important;
        max-width: 288px !important;
    }

    /* Center modals vertically */
    #edit-modal, #confirm-delete-modal {
        align-items: center;
        justify-content: center;
    }

    /* Force left alignment for Description and Action/Solution columns */
    #activity-table tbody td[data-col="6"],
    #activity-table tbody td[data-col="7"] {
        text-align: left !important;
    }

    /* Ensure table cells maintain proper alignment */
    #activity-table tbody td {
        vertical-align: middle;
    }

    /* Make table responsive and fit within viewport */
    #activity-table {
        min-width: 1100px;
        table-layout: fixed;
    }

    /* Allow text wrapping in description and action/solution columns */
    #activity-table tbody td[data-col="6"],
    #activity-table tbody td[data-col="7"] {
        white-space: normal !important;
        word-wrap: break-word;
        vertical-align: top;
        min-height: 3rem;
        padding-top: 0.75rem;
        padding-bottom: 0.75rem;
    }

    /* Adjust table container for better fit */
    .table-responsive {
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
    }

    /* Optimize table header styling */
    #activity-table thead th {
        padding: 0.5rem;
        font-size: 0.75rem;
        line-height: 1rem;
        vertical-align: top;
    }

    /* Allow table rows to have variable heights */
    #activity-table tbody tr {
        height: auto;
    }

    /* Ensure table fits better on screen */
    .container-fluid {
        padding-left: 1rem;
        padding-right: 1rem;
    }
</style>
@endpush

@push('scripts')
<script>
        document.addEventListener('DOMContentLoaded', function () {
            console.log('Activity page loaded, initializing...');

            // Global data array - will be populated from database
            let data = [];
            console.log('Data initialized:', data);

    const tableBody = document.getElementById('data-table-body');
    const editModal = document.getElementById('edit-modal');
    const editForm = document.getElementById('edit-form');
    const closeModalBtn = document.getElementById('close-modal-btn');
    const cancelModalBtn = document.getElementById('cancel-modal-btn');
    const confirmDeleteModal = document.getElementById('confirm-delete-modal');
    const confirmDeleteBtn = document.getElementById('confirm-delete-btn');
    const cancelDeleteBtn = document.getElementById('cancel-delete-btn');

    let selectedCoords = { row: 0, col: 0 };
    let isEditing = false;
    let deleteModalFocusedButton = 'confirm';
    // Updated column order: No, Information Date, User & Position, Department, Application, Type, Description, Action/Solution, Status, Due Date
    const columnKeys = ['no', 'information_date', 'user_position', 'department', 'application', 'type', 'description', 'action_solution', 'status', 'due_date'];
    const editableCols = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // All visible columns except Activity ID (hidden)

    // Date formatting function
    function formatDate(dateString) {
        if (!dateString) return '';
        const date = new Date(dateString);
        const day = String(date.getDate()).padStart(2, '0');
        const monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                           'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        const month = monthNames[date.getMonth()];
        const year = String(date.getFullYear()).slice(-2);
        return `${day}-${month}-${year}`;
    }

    function parseDate(dateString) {
        if (!dateString) return '';
        const [day, month, year] = dateString.split('-');
        const monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                           'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        const monthIndex = monthNames.indexOf(month);
        const monthNum = String(monthIndex + 1).padStart(2, '0');
        return `20${year}-${monthNum}-${day}`;
    }

    // --- AJAX FUNCTIONS ---
    async function loadActivities() {
        try {
            const response = await fetch('/api/activities');
            const result = await response.json();
            if (result.success) {
                data = result.data;
                console.log('Activities loaded from database:', data);
                renderTable();
            } else {
                console.error('Failed to load activities:', result.message);
                showNotification('Failed to load activities', 'error');
            }
        } catch (error) {
            console.error('Error loading activities:', error);
            showNotification('Error loading activities', 'error');
        }
    }

    async function saveActivity(activityData) {
        try {
            console.log('🔄 Saving activity with data:', activityData);
            const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content');
            console.log('🔑 CSRF Token:', csrfToken ? 'Found' : 'NOT FOUND');

            const response = await fetch('/api/activities', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': csrfToken || ''
                },
                body: JSON.stringify(activityData)
            });

            console.log('📡 Response status:', response.status);
            const result = await response.json();
            console.log('📋 Response data:', result);

            if (result.success) {
                console.log('✅ Activity saved:', result.data);
                showNotification('Activity saved successfully', 'success');
                return result.data;
            } else {
                console.error('❌ Failed to save activity:', result.message);
                showNotification('Failed to save activity: ' + result.message, 'error');
                return null;
            }
        } catch (error) {
            console.error('💥 Error saving activity:', error);
            showNotification('Error saving activity', 'error');
            return null;
        }
    }

    async function updateActivity(id, activityData) {
        try {
            console.log('🔄 Updating activity ID:', id, 'with data:', activityData);
            const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content');
            console.log('🔑 CSRF Token:', csrfToken ? 'Found' : 'NOT FOUND');

            const response = await fetch(`/api/activities/${id}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': csrfToken || ''
                },
                body: JSON.stringify(activityData)
            });

            console.log('📡 Response status:', response.status);
            const result = await response.json();
            console.log('📋 Response data:', result);

            if (result.success) {
                console.log('✅ Activity updated:', result.data);
                showNotification('Activity updated successfully', 'success');
                return result.data;
            } else {
                console.error('❌ Failed to update activity:', result.message);
                showNotification('Failed to update activity: ' + result.message, 'error');
                return null;
            }
        } catch (error) {
            console.error('💥 Error updating activity:', error);
            showNotification('Error updating activity', 'error');
            return null;
        }
    }

    async function deleteActivity(id) {
        try {
            const response = await fetch(`/api/activities/${id}`, {
                method: 'DELETE',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || ''
                }
            });
            const result = await response.json();
            if (result.success) {
                console.log('Activity deleted successfully');
                showNotification('Activity deleted successfully', 'success');
                return true;
            } else {
                console.error('Failed to delete activity:', result.message);
                showNotification('Failed to delete activity: ' + result.message, 'error');
                return false;
            }
        } catch (error) {
            console.error('Error deleting activity:', error);
            showNotification('Error deleting activity', 'error');
            return false;
        }
    }

    function showNotification(message, type = 'info') {
        // Simple notification system - you can enhance this
        console.log(`${type.toUpperCase()}: ${message}`);

        // Create a simple notification element
        const notification = document.createElement('div');
        notification.className = `fixed top-4 right-4 px-4 py-2 rounded-md text-white text-sm font-medium z-50 ${
            type === 'success' ? 'bg-green-500' :
            type === 'error' ? 'bg-red-500' :
            'bg-blue-500'
        }`;
        notification.textContent = message;

        document.body.appendChild(notification);

        // Remove after 3 seconds
        setTimeout(() => {
            if (notification.parentNode) {
                notification.parentNode.removeChild(notification);
            }
        }, 3000);
    }

    // --- FUNGSI MODAL ---
    function openEditModal(rowIndex) {
        const item = data[rowIndex];
        document.getElementById('modal-row-index').value = rowIndex;
        document.getElementById('modal-activity-id').value = item.activity_id;
        document.getElementById('modal-project-id').value = item.project_id;
        document.getElementById('modal-no').value = item.no;
        // Format dates for modal inputs (convert dd-mm-yy to yyyy-mm-dd)
        document.getElementById('modal-information-date').value = item.information_date ? parseDate(item.information_date) : '';
        document.getElementById('modal-user-position').value = item.user_position;
        document.getElementById('modal-department').value = item.department;
        document.getElementById('modal-application').value = item.application;
        document.getElementById('modal-type').value = item.type;
        document.getElementById('modal-description').value = item.description;
        document.getElementById('modal-action-solution').value = item.action_solution;
        // Format due date for modal input
        document.getElementById('modal-due-date').value = item.due_date ? parseDate(item.due_date) : '';
        document.getElementById('modal-status').value = item.status;
        document.getElementById('modal-cnc-number').value = item.cnc_number;
        editModal.classList.remove('hidden');
    }

    function closeEditModal() { editModal.classList.add('hidden'); }
    
    function updateDeleteModalFocus() {
        confirmDeleteBtn.classList.remove('modal-button-focus');
        cancelDeleteBtn.classList.remove('modal-button-focus');
        if (deleteModalFocusedButton === 'confirm') {
            confirmDeleteBtn.classList.add('modal-button-focus');
        } else {
            cancelDeleteBtn.classList.add('modal-button-focus');
        }
    }

    function openConfirmModal() {
        confirmDeleteModal.classList.remove('hidden');
        deleteModalFocusedButton = 'confirm';
        updateDeleteModalFocus();
    }

    function closeConfirmModal() {
        confirmDeleteModal.classList.add('hidden');
        confirmDeleteBtn.classList.remove('modal-button-focus');
        cancelDeleteBtn.classList.remove('modal-button-focus');
    }
    
    async function saveModalData(e) {
        e.preventDefault();
        const rowIndex = document.getElementById('modal-row-index').value;
        const activityData = {
            project_id: document.getElementById('modal-project-id').value,
            no: parseInt(document.getElementById('modal-no').value),
            information_date: document.getElementById('modal-information-date').value,
            user_position: document.getElementById('modal-user-position').value,
            department: document.getElementById('modal-department').value,
            application: document.getElementById('modal-application').value,
            type: document.getElementById('modal-type').value,
            description: document.getElementById('modal-description').value,
            action_solution: document.getElementById('modal-action-solution').value,
            due_date: document.getElementById('modal-due-date').value,
            status: document.getElementById('modal-status').value,
            cnc_number: document.getElementById('modal-cnc-number').value
        };

        let result;
        if (data[rowIndex] && data[rowIndex].id) {
            // Update existing activity
            result = await updateActivity(data[rowIndex].id, activityData);
            if (result) {
                data[rowIndex] = result;
            }
        } else {
            // Create new activity
            result = await saveActivity(activityData);
            if (result) {
                data[rowIndex] = result;
            }
        }

        if (result) {
            console.log('Modal data saved for row', rowIndex, data[rowIndex]);
            closeEditModal();
            renderTable();
        }
    }

    // --- FUNGSI AKSI BARIS ---
    async function addNewRow() {
        const today = new Date().toISOString().split('T')[0];
        const newNo = data.length > 0 ? Math.max(...data.map(d => d.no)) + 1 : 1;

        const newActivityData = {
            project_id: '',
            no: newNo,
            information_date: today,
            user_position: '',
            department: 'IT / EDP',
            application: 'Power FO',
            type: 'Setup',
            description: 'New activity...',
            action_solution: '',
            due_date: '',
            status: 'Open',
            cnc_number: ''
        };

        const result = await saveActivity(newActivityData);
        if (result) {
            data.push(result);
            console.log('New row added:', data[data.length - 1]);
            selectedCoords.row = data.length - 1;
            renderTable();
        }
    }
    
    async function deleteSelectedRow() {
        if (data.length === 0) return;
        const activityToDelete = data[selectedCoords.row];

        if (activityToDelete && activityToDelete.id) {
            const success = await deleteActivity(activityToDelete.id);
            if (success) {
                console.log('Deleting row', selectedCoords.row);
                data.splice(selectedCoords.row, 1);
                // Renumber remaining activities
                data.forEach((item, index) => { item.no = index + 1; });
                if (selectedCoords.row >= data.length && data.length > 0) {
                    selectedCoords.row = data.length - 1;
                }
                closeConfirmModal();
                renderTable();
            }
        } else {
            // If no ID, just remove from local array (for unsaved new rows)
            console.log('Deleting unsaved row', selectedCoords.row);
            data.splice(selectedCoords.row, 1);
            data.forEach((item, index) => { item.no = index + 1; });
            if (selectedCoords.row >= data.length && data.length > 0) {
                selectedCoords.row = data.length - 1;
            }
            closeConfirmModal();
            renderTable();
        }
    }

    // --- FUNGSI RENDER & SELEKSI ---
    function renderTable() {
        console.log('Rendering table with data:', data);
        tableBody.innerHTML = '';
        data.forEach((item, rowIndex) => {
            const row = document.createElement('tr');
            row.className = 'bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 cursor-pointer';
            columnKeys.forEach((key, colIndex) => {
                const cell = document.createElement('td');
                cell.dataset.row = rowIndex;
                cell.dataset.col = colIndex;

                let displayValue = item[key] || '';

                // Set alignment and styling based on column
                if (key === 'description' || key === 'action_solution') {
                    cell.className = 'px-2 py-3 text-sm text-gray-900 dark:text-gray-200 text-left break-words'; // Left align for description and action/solution with word wrapping
                } else {
                    cell.className = 'px-2 py-3 whitespace-nowrap text-sm text-gray-900 dark:text-gray-200 text-center'; // Center align for others
                }

                // Format dates to dd-mm-yy
                if (key === 'information_date' || key === 'due_date') {
                    if (displayValue) {
                        displayValue = formatDate(displayValue);
                    }
                }

                // Handle status display
                if (key === 'status') {
                    let badgeClass = '';
                    switch(item.status) {
                        case 'Done':
                            badgeClass = 'bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200';
                            break;
                        case 'On Progress':
                            badgeClass = 'bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200';
                            break;
                        case 'Need Requirement':
                            badgeClass = 'bg-orange-100 dark:bg-orange-900 text-orange-800 dark:text-orange-200';
                            break;
                        case 'Open':
                        default:
                            badgeClass = 'bg-yellow-100 dark:bg-yellow-900 text-yellow-800 dark:text-yellow-200';
                            break;
                    }
                    cell.innerHTML = `<span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full ${badgeClass}">${item.status}</span>`;
                } else {
                    cell.textContent = displayValue;
                }

                // Add text color classes
                if (colIndex === 0) cell.classList.add('font-medium', 'text-gray-900', 'dark:text-white');
                else cell.classList.add('text-gray-600', 'dark:text-gray-300');

                row.appendChild(cell);
            });
            tableBody.appendChild(row);
        });
        updateSelection();
        console.log('Table rendered successfully');
    }

    function updateSelection() {
        document.querySelectorAll('.selected-cell').forEach(c => c.classList.remove('selected-cell'));
        const cell = document.querySelector(`[data-row='${selectedCoords.row}'][data-col='${selectedCoords.col}']`);
        if (cell) cell.classList.add('selected-cell');
    }
    
    function makeCellEditable(cell) {
        if (isEditing || !editableCols.includes(selectedCoords.col)) return;
        isEditing = true;
        const rowIndex = parseInt(cell.dataset.row);
        const colIndex = parseInt(cell.dataset.col);
        const key = columnKeys[colIndex];
        const originalValue = data[rowIndex][key];
        cell.classList.add('editing-cell');
        
        if (key === 'status') {
            cell.innerHTML = `<select class="focus:ring-2 focus:ring-blue-400"><option value="Open" ${originalValue === 'Open' ? 'selected' : ''}>Open</option><option value="On Progress" ${originalValue === 'On Progress' ? 'selected' : ''}>On Progress</option><option value="Need Requirement" ${originalValue === 'Need Requirement' ? 'selected' : ''}>Need Requirement</option><option value="Done" ${originalValue === 'Done' ? 'selected' : ''}>Done</option></select>`;
        } else if (key === 'information_date' || key === 'due_date') {
            // Convert dd-mm-yy back to yyyy-mm-dd for date input
            const dateValue = originalValue ? parseDate(originalValue) : '';
            cell.innerHTML = `<input type="date" value="${dateValue}" class="focus:ring-2 focus:ring-blue-400">`;
        } else if (key === 'department') {
            cell.innerHTML = `<select class="focus:ring-2 focus:ring-blue-400"><option value="Food & Beverage" ${originalValue === 'Food & Beverage' ? 'selected' : ''}>Food & Beverage</option><option value="Kitchen" ${originalValue === 'Kitchen' ? 'selected' : ''}>Kitchen</option><option value="Room Division" ${originalValue === 'Room Division' ? 'selected' : ''}>Room Division</option><option value="Front Office" ${originalValue === 'Front Office' ? 'selected' : ''}>Front Office</option><option value="Housekeeping" ${originalValue === 'Housekeeping' ? 'selected' : ''}>Housekeeping</option><option value="Engineering" ${originalValue === 'Engineering' ? 'selected' : ''}>Engineering</option><option value="Sales & Marketing" ${originalValue === 'Sales & Marketing' ? 'selected' : ''}>Sales & Marketing</option><option value="IT / EDP" ${originalValue === 'IT / EDP' ? 'selected' : ''}>IT / EDP</option><option value="Accounting" ${originalValue === 'Accounting' ? 'selected' : ''}>Accounting</option><option value="Executive Office" ${originalValue === 'Executive Office' ? 'selected' : ''}>Executive Office</option></select>`;
        } else if (key === 'application') {
            cell.innerHTML = `<select class="focus:ring-2 focus:ring-blue-400"><option value="Power FO" ${originalValue === 'Power FO' ? 'selected' : ''}>Power FO</option><option value="My POS" ${originalValue === 'My POS' ? 'selected' : ''}>My POS</option><option value="My MGR" ${originalValue === 'My MGR' ? 'selected' : ''}>My MGR</option><option value="Power AR" ${originalValue === 'Power AR' ? 'selected' : ''}>Power AR</option><option value="Power INV" ${originalValue === 'Power INV' ? 'selected' : ''}>Power INV</option><option value="Power AP" ${originalValue === 'Power AP' ? 'selected' : ''}>Power AP</option><option value="Power GL" ${originalValue === 'Power GL' ? 'selected' : ''}>Power GL</option><option value="Keylock" ${originalValue === 'Keylock' ? 'selected' : ''}>Keylock</option><option value="PABX" ${originalValue === 'PABX' ? 'selected' : ''}>PABX</option><option value="DIM" ${originalValue === 'DIM' ? 'selected' : ''}>DIM</option><option value="Dynamic Room Rate" ${originalValue === 'Dynamic Room Rate' ? 'selected' : ''}>Dynamic Room Rate</option><option value="Channel Manager" ${originalValue === 'Channel Manager' ? 'selected' : ''}>Channel Manager</option><option value="PB1" ${originalValue === 'PB1' ? 'selected' : ''}>PB1</option><option value="Power SIGN" ${originalValue === 'Power SIGN' ? 'selected' : ''}>Power SIGN</option><option value="Multi Properties" ${originalValue === 'Multi Properties' ? 'selected' : ''}>Multi Properties</option><option value="Scanner ID" ${originalValue === 'Scanner ID' ? 'selected' : ''}>Scanner ID</option><option value="IPOS" ${originalValue === 'IPOS' ? 'selected' : ''}>IPOS</option><option value="Power Runner" ${originalValue === 'Power Runner' ? 'selected' : ''}>Power Runner</option><option value="Power RA" ${originalValue === 'Power RA' ? 'selected' : ''}>Power RA</option><option value="Power ME" ${originalValue === 'Power ME' ? 'selected' : ''}>Power ME</option><option value="ECOS" ${originalValue === 'ECOS' ? 'selected' : ''}>ECOS</option><option value="Cloud WS" ${originalValue === 'Cloud WS' ? 'selected' : ''}>Cloud WS</option><option value="Power GO" ${originalValue === 'Power GO' ? 'selected' : ''}>Power GO</option><option value="Dashpad" ${originalValue === 'Dashpad' ? 'selected' : ''}>Dashpad</option><option value="IPTV" ${originalValue === 'IPTV' ? 'selected' : ''}>IPTV</option><option value="HSIA" ${originalValue === 'HSIA' ? 'selected' : ''}>HSIA</option><option value="SGI" ${originalValue === 'SGI' ? 'selected' : ''}>SGI</option><option value="Guest Survey" ${originalValue === 'Guest Survey' ? 'selected' : ''}>Guest Survey</option><option value="Loyalty Management" ${originalValue === 'Loyalty Management' ? 'selected' : ''}>Loyalty Management</option><option value="AccPac" ${originalValue === 'AccPac' ? 'selected' : ''}>AccPac</option><option value="GL Consolidation" ${originalValue === 'GL Consolidation' ? 'selected' : ''}>GL Consolidation</option><option value="Self Check In" ${originalValue === 'Self Check In' ? 'selected' : ''}>Self Check In</option><option value="Check In Desk" ${originalValue === 'Check In Desk' ? 'selected' : ''}>Check In Desk</option><option value="Others" ${originalValue === 'Others' ? 'selected' : ''}>Others</option></select>`;
        } else if (key === 'type') {
            cell.innerHTML = `<select class="focus:ring-2 focus:ring-blue-400"><option value="Setup" ${originalValue === 'Setup' ? 'selected' : ''}>Setup</option><option value="Question" ${originalValue === 'Question' ? 'selected' : ''}>Question</option><option value="Issue" ${originalValue === 'Issue' ? 'selected' : ''}>Issue</option><option value="Report Issue" ${originalValue === 'Report Issue' ? 'selected' : ''}>Report Issue</option><option value="Report Request" ${originalValue === 'Report Request' ? 'selected' : ''}>Report Request</option><option value="Feature Request" ${originalValue === 'Feature Request' ? 'selected' : ''}>Feature Request</option></select>`;
        } else if (key === 'description' || key === 'action_solution') {
            cell.innerHTML = `<textarea rows="3" class="focus:ring-2 focus:ring-blue-400 w-full resize-none" style="min-height: 60px;">${originalValue}</textarea>`;
        } else {
            cell.innerHTML = `<input type="text" value="${originalValue}" class="focus:ring-2 focus:ring-blue-400">`;
        }
        const input = cell.querySelector('input, select, textarea');
        input.focus();
        
        const saveAndExit = async (moveSelectionDown = false) => {
            if (!isEditing) return;

            const newValue = input.value;
            const oldValue = data[rowIndex][key];

            console.log('💾 Inline edit save triggered:', {
                rowIndex,
                colIndex,
                key,
                oldValue,
                newValue,
                hasId: data[rowIndex] && data[rowIndex].id
            });

            // Only save if value changed
            if (newValue !== oldValue) {
                const updateData = { [key]: newValue };

                if (data[rowIndex] && data[rowIndex].id) {
                    // Update existing activity
                    console.log('📝 Updating existing activity via inline edit');
                    const result = await updateActivity(data[rowIndex].id, updateData);
                    if (result) {
                        data[rowIndex][key] = newValue;
                        console.log('✅ Inline edit saved for row', rowIndex, 'col', colIndex, 'value:', newValue);
                    } else {
                        console.log('❌ Failed to save inline edit');
                        return; // Don't exit editing if save failed
                    }
                } else {
                    // For new unsaved rows, just update local data
                    data[rowIndex][key] = newValue;
                    console.log('💾 Inline edit saved locally for row', rowIndex, 'col', colIndex, 'value:', newValue);
                }
            } else {
                console.log('⏭️ No changes detected, skipping save');
            }

            isEditing = false;

            if (moveSelectionDown) {
                if (rowIndex === data.length - 1) { await addNewRow(); return; }
                else { selectedCoords.row++; }
            }
            renderTable();
        };

        input.addEventListener('blur', () => saveAndExit(false));
        input.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') { e.preventDefault(); saveAndExit(true); } 
            else if (e.key === 'Escape') { console.log('Escape pressed, canceling edit'); isEditing = false; renderTable(); }
            else if (e.key === 'Tab') {
                e.preventDefault();
                if (!isEditing) return;
                data[rowIndex][key] = input.value;
                console.log('Tab pressed, moving to next cell');
                isEditing = false;
                let nextRow = rowIndex, nextCol = colIndex + 1;
                if (nextCol >= columnKeys.length) { nextCol = editableCols[0]; nextRow++; }
                if (nextRow >= data.length) { addNewRow(); selectedCoords.col = editableCols[0]; return; }
                else { selectedCoords.row = nextRow; selectedCoords.col = nextCol; }
                renderTable();
            }
        });
    }

    // --- EVENT LISTENERS ---
    document.addEventListener('keydown', (e) => {
        console.log('Key pressed:', e.key, 'isEditing:', isEditing);
        // Prioritaskan event keyboard untuk modal hapus jika sedang aktif
        if (!confirmDeleteModal.classList.contains('hidden')) {
            e.preventDefault();
            switch (e.key) {
                case 'ArrowLeft':
                case 'ArrowRight':
                    deleteModalFocusedButton = (deleteModalFocusedButton === 'confirm') ? 'cancel' : 'confirm';
                    updateDeleteModalFocus();
                    break;
                case 'Enter':
                    if (deleteModalFocusedButton === 'confirm') confirmDeleteBtn.click();
                    else cancelDeleteBtn.click();
                    break;
                case 'y': case 'Y': confirmDeleteBtn.click(); break;
                case 'n': case 'N': case 'Escape': cancelDeleteBtn.click(); break;
            }
            return;
        }

        if (isEditing) return;
        if (e.key === 'Escape') { closeEditModal(); }

        switch (e.key) {
            case 'ArrowUp':
                if (selectedCoords.row > 0) {
                    selectedCoords.row--;
                    console.log('Moved up to row', selectedCoords.row);
                    updateSelection();
                }
                e.preventDefault();
                break;
            case 'ArrowDown':
                if (selectedCoords.row === data.length - 1) {
                    addNewRow();
                } else {
                    selectedCoords.row++;
                    console.log('Moved down to row', selectedCoords.row);
                    updateSelection();
                }
                e.preventDefault();
                break;
            case 'ArrowLeft':
                if (selectedCoords.col > 1) {
                    selectedCoords.col--;
                    console.log('Moved left to col', selectedCoords.col);
                    updateSelection();
                }
                e.preventDefault();
                break;
            case 'ArrowRight':
                if (selectedCoords.col < columnKeys.length - 1) {
                    selectedCoords.col++;
                    console.log('Moved right to col', selectedCoords.col);
                    updateSelection();
                }
                e.preventDefault();
                break;
            case 'Delete':
                if (data.length > 0) {
                    console.log('Opening delete modal');
                    openConfirmModal();
                }
                e.preventDefault();
                break;
            case 'Enter':
            case 'F2':
                const cell = document.querySelector(`[data-row='${selectedCoords.row}'][data-col='${selectedCoords.col}']`);
                if (cell) {
                    console.log('Making cell editable:', selectedCoords);
                    makeCellEditable(cell);
                }
                e.preventDefault();
                break;
        }
    });

    tableBody.addEventListener('click', (e) => {
        const cell = e.target.closest('td');
        if (!cell) return;
        const rowIndex = parseInt(cell.dataset.row);
        if (e.ctrlKey) { 
            openEditModal(rowIndex); 
        } else { 
            selectedCoords.row = rowIndex; 
            selectedCoords.col = parseInt(cell.dataset.col); 
            updateSelection(); 
        }
    });

    tableBody.addEventListener('dblclick', (e) => {
        if(e.ctrlKey) return;
        const cell = e.target.closest('td');
        if (!cell || isEditing) return;
        const colIndex = parseInt(cell.dataset.col);
        if (editableCols.includes(colIndex)) makeCellEditable(cell);
    });

    // Listener Modal Edit
    closeModalBtn.addEventListener('click', closeEditModal);
    cancelModalBtn.addEventListener('click', closeEditModal);
    editForm.addEventListener('submit', saveModalData);
    // Listener Modal Hapus
    confirmDeleteBtn.addEventListener('click', deleteSelectedRow);
    cancelDeleteBtn.addEventListener('click', closeConfirmModal);

            // Test API connectivity
            async function testAPIConnection() {
                try {
                    console.log('🔍 Testing API connectivity...');
                    const response = await fetch('/api/activities');
                    console.log('🌐 API Response status:', response.status);
                    if (response.ok) {
                        console.log('✅ API is accessible');
                    } else {
                        console.log('❌ API returned error status:', response.status);
                    }
                } catch (error) {
                    console.log('💥 API connection failed:', error);
                }
            }

            // Inisialisasi - Load data from database
            testAPIConnection();
            loadActivities();
        });
    </script>
@endpush
