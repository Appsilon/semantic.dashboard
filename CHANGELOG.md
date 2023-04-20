# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/).

## [Unreleased]
### Added
- `sidebarUserPanel` was added increasing support of `shinydashboard` functions

### Changed
### Fixed
### Removed

## [0.2.0] - 15.01.2021
### Added
- `title`, `titleWidth`, `left`, `center`, `right`, `show_menu_button` and `menu_button_label` parameters for `dashboardHeader`
- `overlay` and `dim_page` parameters for `dashboardSidebar`
- `margin` param for `dashboardPage`
- `fluid` param for `tabItem`
- `class` param for `dashboardPage`, `dashboardBody`, `dashboardSidebar` and `dashboardHeader` 
- `dashboardPage`, `dashboardBody`, `dashboardSidebar` and `dashboardHeader` have now built-in CSS classes of syntax `dashboard-<component>` e.g. `dashboard-page`. Thanks to that it's easy to write selectors for DOM nodes related to them
- pkgdown documentation
- tests for dropdown menu, utils and value box

### Changed
- Main content will shrink, not move when sidebar is opened and `overlay = FALSE`
### Fixed
- Issues with layout responsiveness
- Issues with sidebar position and overflow

## [0.1.5] - 2020-03-30
### Added
- option for collapsible icon
- themes support
- conditionPanel
- logo in top panel

### Changed
- extended sidebar options
- width values for semantic classes forces
- README

### Fixed
- collapsible box 
- dashboard body without left margin

## [0.1.0] - 2018-01-02
### Added
- box
- sidebarMenu
- dashboardBody
- dashboardHeader
- dashboardPage
- dashboardSidebar
- menuItem
- renderValueBox
- tabItem
- tabItems
- valueBox
- valueBoxOutput
- dropdownMenu
- dropdownMenuOutput
- infoBox
- infoBoxOutput
- messageItem
- notificationItem
- renderDropdownMenu
- renderInfoBox
- tabBox
- taskItem

[Unreleased]: https://github.com/Appsilon/semantic.dashboard/compare/0.1.0...HEAD
[0.1.0]: https://github.com/Appsilon/semantic.dashboard/compare/efb5ed9abfd48be547e4ff191925dd5b02f971b2...0.1.0
