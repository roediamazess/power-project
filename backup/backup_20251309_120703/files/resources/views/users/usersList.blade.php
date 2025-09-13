@extends('layout.layout')
@php
    $title='Users List';
    $subTitle = 'Users List';
    $script ='<script>
                        $(".remove-item-btn").on("click", function() {
                            $(this).closest("tr").addClass("hidden")
                        });
            </script>';
@endphp

@section('content')

    <div class="grid grid-cols-12">
        <div class="col-span-12">
            <div class="card h-full p-0 rounded-xl border-0 overflow-hidden">
                <div class="card-header border-b border-neutral-200 dark:border-neutral-600 bg-white dark:bg-neutral-700 py-4 px-6 flex items-center flex-wrap gap-3 justify-between">
                    <div class="flex items-center flex-wrap gap-3">
                        <span class="text-base font-medium text-secondary-light mb-0">Show</span>
                        <select class="form-select form-select-sm w-auto dark:bg-neutral-600 dark:text-white border-neutral-200 dark:border-neutral-500 rounded-lg">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                        </select>
                        <form class="navbar-search">
                            <input type="text" class="bg-white dark:bg-neutral-700 h-10 w-auto" name="search" placeholder="Search">
                            <iconify-icon icon="ion:search-outline" class="icon"></iconify-icon>
                        </form>
                        <select class="form-select form-select-sm w-auto dark:bg-neutral-600 dark:text-white border-neutral-200 dark:border-neutral-500 rounded-lg">
                            <option>Status</option>
                            <option>Active</option>
                            <option>Inactive</option>
                        </select>
                    </div>
                    <a href="{{ route('addUser') }}" class="btn btn-primary text-sm btn-sm px-3 py-3 rounded-lg flex items-center gap-2">
                        <iconify-icon icon="ic:baseline-plus" class="icon text-xl line-height-1"></iconify-icon>
                        Add New User
                    </a>
                </div>
                <div class="card-body p-6">
                    <div class="table-responsive scroll-sm">
                        <table class="table bordered-table sm-table mb-0">
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="flex items-center gap-10">
                                            <div class="form-check style-check flex items-center">
                                                <input class="form-check-input rounded border input-form-dark" type="checkbox" name="checkbox"
                                                        id="selectAll">
                                            </div>
                                            S.L
                                        </div>
                                    </th>
                                    <th scope="col">Join Date</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Designation</th>
                                    <th scope="col">Role</th>
                                    <th scope="col" class="text-center">Status</th>
                                    <th scope="col" class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="flex items-center gap-10">
                                            <div class="form-check style-check flex items-center">
                                                <input class="form-check-input rounded border border-neutral-400" type="checkbox" name="checkbox"
                                                        id="SL-1">
                                            </div>
                                            01
                                        </div>
                                    </td>
                                    <td>25 Jan 2025</td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="{{ asset('assets/images/user-list/user-list1.png') }}" alt=""
                                                    class="w-10 h-10 rounded-full shrink-0 me-2 overflow-hidden">
                                            <div class="grow">
                                                <span class="text-base mb-0 font-normal text-secondary-light">Kathryn Murphy</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="text-base mb-0 font-normal text-secondary-light">osgoodwy@gmail.com</span></td>
                                    <td>HR</td>
                                    <td>Manager</td>
                                    <td>
                                        <span class="bg-blue-100 dark:bg-blue-600/25 text-blue-600 dark:text-blue-400 border border-blue-600 px-3 py-1 rounded-full text-xs font-medium">Administrator</span>
                                    </td>
                                    <td class="text-center">
                                        <span class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 border border-success-600 px-6 py-1.5 rounded font-medium text-sm">Active</span>
                                    </td>
                                    <td class="text-center">
                                        <div class="flex items-center gap-3 justify-center">
                                            <button type="button"
                                                    class="bg-info-100 dark:bg-info-600/25 hover:bg-info-200 text-info-600 dark:text-info-400 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="majesticons:eye-line" class="icon text-xl"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 bg-hover-success-200 font-medium w-10 h-10 flex justify-center items-center rounded-full"
                                                    data-user-id="1"
                                                    data-user-name="Kathryn Murphy"
                                                    data-user-role="Administrator">
                                                <iconify-icon icon="lucide:edit" class="menu-icon"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="remove-item-btn bg-danger-100 dark:bg-danger-600/25 hover:bg-danger-200 text-danger-600 dark:text-danger-500 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="fluent:delete-24-regular" class="menu-icon"></iconify-icon>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flex items-center gap-10">
                                            <div class="form-check style-check flex items-center">
                                                <input class="form-check-input rounded border border-neutral-400" type="checkbox" name="checkbox"
                                                        id="SL-2">
                                            </div>
                                            02
                                        </div>
                                    </td>
                                    <td>25 Jan 2025</td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="{{ asset('assets/images/user-list/user-list2.png') }}" alt=""
                                                    class="w-10 h-10 rounded-full shrink-0 me-2 overflow-hidden">
                                            <div class="grow">
                                                <span class="text-base mb-0 font-normal text-secondary-light">Annette Black</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="text-base mb-0 font-normal text-secondary-light">redaniel@gmail.com</span></td>
                                    <td>Design</td>
                                    <td>UI UX Designer</td>
                                    <td class="text-center">
                                        <span class="bg-neutral-200 dark:bg-neutral-600 text-neutral-600 border border-neutral-400 px-6 py-1.5 rounded font-medium text-sm">Inactive</span>
                                    </td>
                                    <td class="text-center">
                                        <div class="flex items-center gap-3 justify-center">
                                            <button type="button"
                                                    class="bg-info-100 dark:bg-info-600/25 hover:bg-info-200 text-info-600 dark:text-info-400 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="majesticons:eye-line" class="icon text-xl"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 bg-hover-success-200 font-medium w-10 h-10 flex justify-center items-center rounded-full"
                                                    data-user-id="1"
                                                    data-user-name="Kathryn Murphy"
                                                    data-user-role="Administrator">
                                                <iconify-icon icon="lucide:edit" class="menu-icon"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="remove-item-btn bg-danger-100 dark:bg-danger-600/25 hover:bg-danger-200 text-danger-600 dark:text-danger-500 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="fluent:delete-24-regular" class="menu-icon"></iconify-icon>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flex items-center gap-10">
                                            <div class="form-check style-check flex items-center">
                                                <input class="form-check-input rounded border border-neutral-400" type="checkbox" name="checkbox"
                                                        id="SL-3">
                                            </div>
                                            03
                                        </div>
                                    </td>
                                    <td>10 Feb 2025</td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="{{ asset('assets/images/user-list/user-list3.png') }}" alt=""
                                                    class="w-10 h-10 rounded-full shrink-0 me-2 overflow-hidden">
                                            <div class="grow">
                                                <span class="text-base mb-0 font-normal text-secondary-light">Ronald Richards</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="text-base mb-0 font-normal text-secondary-light">seannand@mail.ru</span></td>
                                    <td>Design</td>
                                    <td>UI UX Designer</td>
                                    <td class="text-center">
                                        <span class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 border border-success-600 px-6 py-1.5 rounded font-medium text-sm">Active</span>
                                    </td>
                                    <td class="text-center">
                                        <div class="flex items-center gap-3 justify-center">
                                            <button type="button"
                                                    class="bg-info-100 dark:bg-info-600/25 hover:bg-info-200 text-info-600 dark:text-info-400 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="majesticons:eye-line" class="icon text-xl"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 bg-hover-success-200 font-medium w-10 h-10 flex justify-center items-center rounded-full"
                                                    data-user-id="1"
                                                    data-user-name="Kathryn Murphy"
                                                    data-user-role="Administrator">
                                                <iconify-icon icon="lucide:edit" class="menu-icon"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="remove-item-btn bg-danger-100 dark:bg-danger-600/25 hover:bg-danger-200 text-danger-600 dark:text-danger-500 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="fluent:delete-24-regular" class="menu-icon"></iconify-icon>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flex items-center gap-10">
                                            <div class="form-check style-check flex items-center">
                                                <input class="form-check-input rounded border border-neutral-400" type="checkbox" name="checkbox"
                                                        id="SL-4">
                                            </div>
                                            04
                                        </div>
                                    </td>
                                    <td>10 Feb 2025</td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="{{ asset('assets/images/user-list/user-list4.png') }}" alt=""
                                                    class="w-10 h-10 rounded-full shrink-0 me-2 overflow-hidden">
                                            <div class="grow">
                                                <span class="text-base mb-0 font-normal text-secondary-light">Eleanor Pena</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="text-base mb-0 font-normal text-secondary-light">miyokoto@mail.ru</span></td>
                                    <td>Design</td>
                                    <td>UI UX Designer</td>
                                    <td class="text-center">
                                        <span class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 border border-success-600 px-6 py-1.5 rounded font-medium text-sm">Active</span>
                                    </td>
                                    <td class="text-center">
                                        <div class="flex items-center gap-3 justify-center">
                                            <button type="button"
                                                    class="bg-info-100 dark:bg-info-600/25 hover:bg-info-200 text-info-600 dark:text-info-400 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="majesticons:eye-line" class="icon text-xl"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 bg-hover-success-200 font-medium w-10 h-10 flex justify-center items-center rounded-full"
                                                    data-user-id="1"
                                                    data-user-name="Kathryn Murphy"
                                                    data-user-role="Administrator">
                                                <iconify-icon icon="lucide:edit" class="menu-icon"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="remove-item-btn bg-danger-100 dark:bg-danger-600/25 hover:bg-danger-200 text-danger-600 dark:text-danger-500 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="fluent:delete-24-regular" class="menu-icon"></iconify-icon>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flex items-center gap-10">
                                            <div class="form-check style-check flex items-center">
                                                <input class="form-check-input rounded border border-neutral-400" type="checkbox" name="checkbox"
                                                        id="SL-5">
                                            </div>
                                            05
                                        </div>
                                    </td>
                                    <td>15 March 2025</td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="{{ asset('assets/images/user-list/user-list5.png') }}" alt=""
                                                    class="w-10 h-10 rounded-full shrink-0 me-2 overflow-hidden">
                                            <div class="grow">
                                                <span class="text-base mb-0 font-normal text-secondary-light">Leslie Alexander</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="text-base mb-0 font-normal text-secondary-light">icadahli@gmail.com</span></td>
                                    <td>Design</td>
                                    <td>UI UX Designer</td>
                                    <td class="text-center">
                                        <span class="bg-neutral-200 dark:bg-neutral-600 text-neutral-600 border border-neutral-400 px-6 py-1.5 rounded font-medium text-sm">Inactive</span>
                                    </td>
                                    <td class="text-center">
                                        <div class="flex items-center gap-3 justify-center">
                                            <button type="button"
                                                    class="bg-info-100 dark:bg-info-600/25 hover:bg-info-200 text-info-600 dark:text-info-400 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="majesticons:eye-line" class="icon text-xl"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 bg-hover-success-200 font-medium w-10 h-10 flex justify-center items-center rounded-full"
                                                    data-user-id="1"
                                                    data-user-name="Kathryn Murphy"
                                                    data-user-role="Administrator">
                                                <iconify-icon icon="lucide:edit" class="menu-icon"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="remove-item-btn bg-danger-100 dark:bg-danger-600/25 hover:bg-danger-200 text-danger-600 dark:text-danger-500 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="fluent:delete-24-regular" class="menu-icon"></iconify-icon>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flex items-center gap-10">
                                            <div class="form-check style-check flex items-center">
                                                <input class="form-check-input rounded border border-neutral-400" type="checkbox" name="checkbox"
                                                        id="SL-6">
                                            </div>
                                            06
                                        </div>
                                    </td>
                                    <td>15 March 2025</td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="{{ asset('assets/images/user-list/user-list6.png') }}" alt=""
                                                    class="w-10 h-10 rounded-full shrink-0 me-2 overflow-hidden">
                                            <div class="grow">
                                                <span class="text-base mb-0 font-normal text-secondary-light">Albert Flores</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="text-base mb-0 font-normal text-secondary-light">warn@mail.ru</span></td>
                                    <td>Design</td>
                                    <td>UI UX Designer</td>
                                    <td class="text-center">
                                        <span class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 border border-success-600 px-6 py-1.5 rounded font-medium text-sm">Active</span>
                                    </td>
                                    <td class="text-center">
                                        <div class="flex items-center gap-3 justify-center">
                                            <button type="button"
                                                    class="bg-info-100 dark:bg-info-600/25 hover:bg-info-200 text-info-600 dark:text-info-400 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="majesticons:eye-line" class="icon text-xl"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 bg-hover-success-200 font-medium w-10 h-10 flex justify-center items-center rounded-full"
                                                    data-user-id="1"
                                                    data-user-name="Kathryn Murphy"
                                                    data-user-role="Administrator">
                                                <iconify-icon icon="lucide:edit" class="menu-icon"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="remove-item-btn bg-danger-100 dark:bg-danger-600/25 hover:bg-danger-200 text-danger-600 dark:text-danger-500 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="fluent:delete-24-regular" class="menu-icon"></iconify-icon>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flex items-center gap-10">
                                            <div class="form-check style-check flex items-center">
                                                <input class="form-check-input rounded border border-neutral-400" type="checkbox" name="checkbox"
                                                        id="SL-7">
                                            </div>
                                            07
                                        </div>
                                    </td>
                                    <td>27 April 2025</td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="{{ asset('assets/images/user-list/user-list7.png') }}" alt=""
                                                    class="w-10 h-10 rounded-full shrink-0 me-2 overflow-hidden">
                                            <div class="grow">
                                                <span class="text-base mb-0 font-normal text-secondary-light">Jacob Jones</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="text-base mb-0 font-normal text-secondary-light">zitka@mail.ru</span></td>
                                    <td>Development</td>
                                    <td>Frontend developer</td>
                                    <td class="text-center">
                                        <span class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 border border-success-600 px-6 py-1.5 rounded font-medium text-sm">Active</span>
                                    </td>
                                    <td class="text-center">
                                        <div class="flex items-center gap-3 justify-center">
                                            <button type="button"
                                                    class="bg-info-100 dark:bg-info-600/25 hover:bg-info-200 text-info-600 dark:text-info-400 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="majesticons:eye-line" class="icon text-xl"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 bg-hover-success-200 font-medium w-10 h-10 flex justify-center items-center rounded-full"
                                                    data-user-id="1"
                                                    data-user-name="Kathryn Murphy"
                                                    data-user-role="Administrator">
                                                <iconify-icon icon="lucide:edit" class="menu-icon"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="remove-item-btn bg-danger-100 dark:bg-danger-600/25 hover:bg-danger-200 text-danger-600 dark:text-danger-500 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="fluent:delete-24-regular" class="menu-icon"></iconify-icon>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flex items-center gap-10">
                                            <div class="form-check style-check flex items-center">
                                                <input class="form-check-input rounded border border-neutral-400" type="checkbox" name="checkbox"
                                                        id="SL-8">
                                            </div>
                                            08
                                        </div>
                                    </td>
                                    <td>25 Jan 2025</td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="{{ asset('assets/images/user-list/user-list8.png') }}" alt=""
                                                    class="w-10 h-10 rounded-full shrink-0 me-2 overflow-hidden">
                                            <div class="grow">
                                                <span class="text-base mb-0 font-normal text-secondary-light">Jerome Bell</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="text-base mb-0 font-normal text-secondary-light">igerrin@gmail.com</span></td>
                                    <td>Development</td>
                                    <td>Frontend developer</td>
                                    <td class="text-center">
                                        <span class="bg-neutral-200 dark:bg-neutral-600 text-neutral-600 border border-neutral-400 px-6 py-1.5 rounded font-medium text-sm">Inactive</span>
                                    </td>
                                    <td class="text-center">
                                        <div class="flex items-center gap-3 justify-center">
                                            <button type="button"
                                                    class="bg-info-100 dark:bg-info-600/25 hover:bg-info-200 text-info-600 dark:text-info-400 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="majesticons:eye-line" class="icon text-xl"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 bg-hover-success-200 font-medium w-10 h-10 flex justify-center items-center rounded-full"
                                                    data-user-id="1"
                                                    data-user-name="Kathryn Murphy"
                                                    data-user-role="Administrator">
                                                <iconify-icon icon="lucide:edit" class="menu-icon"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="remove-item-btn bg-danger-100 dark:bg-danger-600/25 hover:bg-danger-200 text-danger-600 dark:text-danger-500 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="fluent:delete-24-regular" class="menu-icon"></iconify-icon>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flex items-center gap-10">
                                            <div class="form-check style-check flex items-center">
                                                <input class="form-check-input rounded border border-neutral-400" type="checkbox" name="checkbox"
                                                        id="SL-9">
                                            </div>
                                            09
                                        </div>
                                    </td>
                                    <td>30 April 2025</td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="{{ asset('assets/images/user-list/user-list2.png') }}" alt=""
                                                    class="w-10 h-10 rounded-full shrink-0 me-2 overflow-hidden">
                                            <div class="grow">
                                                <span class="text-base mb-0 font-normal text-secondary-light">Marvin McKinney</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="text-base mb-0 font-normal text-secondary-light">maka@yandex.ru</span></td>
                                    <td>Development</td>
                                    <td>Frontend developer</td>
                                    <td class="text-center">
                                        <span class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 border border-success-600 px-6 py-1.5 rounded font-medium text-sm">Active</span>
                                    </td>
                                    <td class="text-center">
                                        <div class="flex items-center gap-3 justify-center">
                                            <button type="button"
                                                    class="bg-info-100 dark:bg-info-600/25 hover:bg-info-200 text-info-600 dark:text-info-400 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="majesticons:eye-line" class="icon text-xl"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 bg-hover-success-200 font-medium w-10 h-10 flex justify-center items-center rounded-full"
                                                    data-user-id="1"
                                                    data-user-name="Kathryn Murphy"
                                                    data-user-role="Administrator">
                                                <iconify-icon icon="lucide:edit" class="menu-icon"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="remove-item-btn bg-danger-100 dark:bg-danger-600/25 hover:bg-danger-200 text-danger-600 dark:text-danger-500 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="fluent:delete-24-regular" class="menu-icon"></iconify-icon>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="flex items-center gap-10">
                                            <div class="form-check style-check flex items-center">
                                                <input class="form-check-input rounded border border-neutral-400" type="checkbox" name="checkbox"
                                                        id="SL-10">
                                            </div>
                                            10
                                        </div>
                                    </td>
                                    <td>30 April 2025</td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="{{ asset('assets/images/user-list/user-list10.png') }}" alt=""
                                                    class="w-10 h-10 rounded-full shrink-0 me-2 overflow-hidden">
                                            <div class="grow">
                                                <span class="text-base mb-0 font-normal text-secondary-light">Cameron Williamson</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="text-base mb-0 font-normal text-secondary-light">danten@mail.ru</span></td>
                                    <td>Development</td>
                                    <td>Frontend developer</td>
                                    <td class="text-center">
                                        <span class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 border border-success-600 px-6 py-1.5 rounded font-medium text-sm">Active</span>
                                    </td>
                                    <td class="text-center">
                                        <div class="flex items-center gap-3 justify-center">
                                            <button type="button"
                                                    class="bg-info-100 dark:bg-info-600/25 hover:bg-info-200 text-info-600 dark:text-info-400 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="majesticons:eye-line" class="icon text-xl"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="bg-success-100 dark:bg-success-600/25 text-success-600 dark:text-success-400 bg-hover-success-200 font-medium w-10 h-10 flex justify-center items-center rounded-full"
                                                    data-user-id="1"
                                                    data-user-name="Kathryn Murphy"
                                                    data-user-role="Administrator">
                                                <iconify-icon icon="lucide:edit" class="menu-icon"></iconify-icon>
                                            </button>
                                            <button type="button"
                                                    class="remove-item-btn bg-danger-100 dark:bg-danger-600/25 hover:bg-danger-200 text-danger-600 dark:text-danger-500 font-medium w-10 h-10 flex justify-center items-center rounded-full">
                                                <iconify-icon icon="fluent:delete-24-regular" class="menu-icon"></iconify-icon>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="flex items-center justify-between flex-wrap gap-2 mt-6">
                        <span>Showing 1 to 10 of 12 entries</span>
                        <ul class="pagination flex flex-wrap items-center gap-2 justify-center">
                            <li class="page-item">
                                <a class="page-link bg-neutral-300 dark:bg-neutral-600 text-secondary-light font-semibold rounded-lg border-0 flex items-center justify-center h-8 w-8 text-base"
                                    href="javascript:void(0)"><iconify-icon icon="ep:d-arrow-left" class=""></iconify-icon></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link text-secondary-light font-semibold rounded-lg border-0 flex items-center justify-center h-8 w-8 text-base bg-primary-600 text-white"
                                    href="javascript:void(0)">1</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link bg-neutral-300 dark:bg-neutral-600 text-secondary-light font-semibold rounded-lg border-0 flex items-center justify-center h-8 w-8"
                                    href="javascript:void(0)">2</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link bg-neutral-300 dark:bg-neutral-600 text-secondary-light font-semibold rounded-lg border-0 flex items-center justify-center h-8 w-8 text-base"
                                    href="javascript:void(0)">3</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link bg-neutral-300 dark:bg-neutral-600 text-secondary-light font-semibold rounded-lg border-0 flex items-center justify-center h-8 w-8 text-base"
                                    href="javascript:void(0)">4</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link bg-neutral-300 dark:bg-neutral-600 text-secondary-light font-semibold rounded-lg border-0 flex items-center justify-center h-8 w-8 text-base"
                                    href="javascript:void(0)">5</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link bg-neutral-300 dark:bg-neutral-600 text-secondary-light font-semibold rounded-lg border-0 flex items-center justify-center h-8 w-8 text-base"
                                    href="javascript:void(0)"> <iconify-icon icon="ep:d-arrow-right" class=""></iconify-icon> </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Role Modal -->
    <div id="editRoleModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden z-50">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white dark:bg-gray-800">
            <div class="mt-3">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-medium text-gray-900 dark:text-white">Edit User Role</h3>
                    <button type="button" id="closeEditModal" class="text-gray-400 hover:text-gray-600 dark:hover:text-gray-300">
                        <iconify-icon icon="mdi:close" class="text-xl"></iconify-icon>
                    </button>
                </div>
                
                <form id="editRoleForm">
                    <input type="hidden" id="editUserId" name="user_id">
                    
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            User: <span id="editUserName" class="font-semibold"></span>
                        </label>
                    </div>
                    
                    <div class="mb-4">
                        <label for="editUserRole" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            User Role <span class="text-red-500">*</span>
                        </label>
                        <select id="editUserRole" name="role" class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 dark:bg-gray-700 dark:text-white">
                            <option value="">Select Role</option>
                            <option value="Administrator">Administrator</option>
                            <option value="Management">Management</option>
                            <option value="Admin Officer">Admin Officer</option>
                            <option value="User">User</option>
                            <option value="Client">Client</option>
                        </select>
                    </div>
                    
                    <div class="flex justify-end space-x-3">
                        <button type="button" id="cancelEditRole" class="px-4 py-2 bg-gray-300 dark:bg-gray-600 text-gray-700 dark:text-gray-300 rounded-md hover:bg-gray-400 dark:hover:bg-gray-500 transition-colors">
                            Cancel
                        </button>
                        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors">
                            Update Role
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Get modal elements
            const editRoleModal = document.getElementById('editRoleModal');
            const closeEditModal = document.getElementById('closeEditModal');
            const cancelEditRole = document.getElementById('cancelEditRole');
            const editRoleForm = document.getElementById('editRoleForm');
            const editUserId = document.getElementById('editUserId');
            const editUserName = document.getElementById('editUserName');
            const editUserRole = document.getElementById('editUserRole');

            // Open modal function
            function openEditRoleModal(userId, userName, currentRole) {
                editUserId.value = userId;
                editUserName.textContent = userName;
                editUserRole.value = currentRole;
                editRoleModal.classList.remove('hidden');
            }

            // Close modal function
            function closeModal() {
                editRoleModal.classList.add('hidden');
                editRoleForm.reset();
            }

            // Event listeners
            closeEditModal.addEventListener('click', closeModal);
            cancelEditRole.addEventListener('click', closeModal);

            // Close modal when clicking outside
            editRoleModal.addEventListener('click', function(e) {
                if (e.target === editRoleModal) {
                    closeModal();
                }
            });

            // Handle form submission
            editRoleForm.addEventListener('submit', async function(e) {
                e.preventDefault();
                
                const userId = editUserId.value;
                const newRole = editUserRole.value;

                if (!newRole) {
                    alert('Please select a role');
                    return;
                }

                try {
                    const response = await fetch(`/api/users/${userId}/update-role`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                        },
                        body: JSON.stringify({ role: newRole })
                    });

                    const result = await response.json();

                    if (result.success) {
                        alert('User role updated successfully!');
                        closeModal();
                        // Refresh the page to show updated data
                        window.location.reload();
                    } else {
                        alert('Error: ' + result.message);
                    }
                } catch (error) {
                    console.error('Error:', error);
                    alert('An error occurred while updating the role');
                }
            });

            // Add click handlers to edit buttons
            document.querySelectorAll('button[data-user-id]').forEach(button => {
                button.addEventListener('click', function() {
                    const userId = this.getAttribute('data-user-id');
                    const userName = this.getAttribute('data-user-name');
                    const currentRole = this.getAttribute('data-user-role');
                    openEditRoleModal(userId, userName, currentRole);
                });
            });
        });
    </script>

@endsection