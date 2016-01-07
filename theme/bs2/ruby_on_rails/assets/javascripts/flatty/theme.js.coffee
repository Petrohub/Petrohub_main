$(document).ready ->
  setScrollable()
  setTimeAgo()
  setAutoSize()
  setCharCounter()
  setMaxLength()
  setValidateForm()
  setSortable($(".sortable"))
  setSelect2()

  # --------------------------------------------------------------------------------------------------------------------
  # datetimepickers
  $(".datetimepicker").datetimepicker()

  $(".datepicker").datetimepicker
    pickTime: false

  $(".timepicker").datetimepicker
    pickDate: false
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # setting up basic wysiwyg
  $('.wysihtml5').wysihtml5();
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # setting up sortable list
  $('.dd').nestable()
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # setting up responsive tabs
  $('.nav-responsive.nav-pills, .nav-responsive.nav-tabs').tabdrop()
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # setting up naked password for password strength
  $("input.nakedpassword").nakedPassword
    path: "assets/images/plugins/naked_password/"
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # setting up datatables
  setDataTable($(".data-table"))
  setDataTable($(".data-table-column-filter"))
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # removes .box after click on .box-remove button
  $(".box .box-remove").live "click", (e) ->
    $(this).parents(".box").first().remove()
    e.preventDefault()
    return false

  # hides .box after click on .box-collapse
  $(".box .box-collapse").live "click", (e) ->
    box = $(this).parents(".box").first()
    box.toggleClass("box-collapsed")
    e.preventDefault()
    return false
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # setting up bootstrap popovers
  if Modernizr.touch == false
    $("body").on "mouseenter", ".has-popover", ->
      el = $(this)
      if el.data("popover") is `undefined`
        el.popover
          placement: el.data("placement") or "top"
          container: "body"
      el.popover "show"

    $("body").on "mouseleave", ".has-popover", ->
      $(this).popover "hide"
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # setting up bootstrap tooltips
  if Modernizr.touch == false
    $("body").on "mouseenter", ".has-tooltip", ->
      el = $(this)
      if el.data("tooltip") is `undefined`
        el.tooltip
          placement: el.data("placement") or "top"
          container: "body"
      el.tooltip "show"

    $("body").on "mouseleave", ".has-tooltip", ->
      $(this).tooltip "hide"
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # check all checkboxes in table with class only-checkbox
  $(".check-all").live "click", (e) ->
    $(this).parents("table:eq(0)").find(".only-checkbox :checkbox").attr "checked", @checked
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # color pickers
  $(".colorpicker-hex").colorpicker format: "hex"
  $(".colorpicker-rgb").colorpicker format: "rgb"
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # modernizr fallbacks
  unless Modernizr.input.placeholder
    $("[placeholder]").focus(->
      input = $(this)
      if input.val() is input.attr("placeholder")
        input.val ""
        input.removeClass "placeholder"
    ).blur(->
      input = $(this)
      if input.val() is "" or input.val() is input.attr("placeholder")
        input.addClass "placeholder"
        input.val input.attr("placeholder")
    ).blur()
    $("[placeholder]").parents("form").submit ->
      $(this).find("[placeholder]").each ->
        input = $(this)
        input.val ""  if input.val() is input.attr("placeholder")
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # affixing main navigation
  unless $("body").hasClass("fixed-header")
    $('#main-nav.main-nav-fixed').affix
      offset: 40
  # --------------------------------------------------------------------------------------------------------------------

  # --------------------------------------------------------------------------------------------------------------------
  # setting bootstrap file input
  $('input[type=file]').bootstrapFileInput();
  # --------------------------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------------------------
# select2
@setSelect2 = (selector = $(".select2")) ->
  selector.each (i, elem) ->
    $(elem).select2()
# --------------------------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------------------------
# form validation
@setValidateForm = (selector = $(".validate-form")) ->
  selector.each (i, elem) ->
    $(elem).validate
      errorElement: "span"
      errorClass: "help-block error"
      errorPlacement: (e, t) ->
        t.parents(".controls").append e

      highlight: (e) ->
        $(e).closest(".control-group").removeClass("error success").addClass "error"

      success: (e) ->
        e.closest(".control-group").removeClass("error")
# --------------------------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------------------------
# autosize feature for expanding textarea elements
@setDataTable = (selector) ->
  selector.each (i, elem) ->
    if $(elem).data("pagination-top-bottom") == true
      sdom = "<'row-fluid datatables-top'<'span6'l><'span6 text-right'pf>r>t<'row-fluid datatables-bottom'<'span6'i><'span6 text-right'p>>"
    else if $(elem).data("pagination-top") == true
      sdom = "<'row-fluid datatables-top'<'span6'l><'span6 text-right'pf>r>t<'row-fluid datatables-bottom'<'span6'i><'span6 text-right'>>"
    else
      sdom = "<'row-fluid datatables-top'<'span6'l><'span6 text-right'f>r>t<'row-fluid datatables-bottom'<'span6'i><'span6 text-right'p>>"

    dt = $(elem).dataTable
      sDom: sdom
      sPaginationType: "bootstrap"
      "iDisplayLength": $(elem).data("pagination-records") || 10
      oLanguage:
        sLengthMenu: "_MENU_ records per page"
    dt.columnFilter() if $(elem).hasClass("data-table-column-filter")

# --------------------------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------------------------
# character counter
@setMaxLength = (selector = $(".char-max-length")) ->
  selector.maxlength()
# --------------------------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------------------------
# character counter
@setCharCounter = (selector = $(".char-counter")) ->
  selector.charCount
    allowed: selector.data("char-allowed")
    warning: selector.data("char-warning")
    cssWarning: "text-warning"
    cssExceeded: "text-error"
# --------------------------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------------------------
# autosize feature for expanding textarea elements
@setAutoSize = (selector = $(".autosize")) ->
  selector.autosize()
# --------------------------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------------------------
# timeago feature converts static time to dynamically refreshed
@setTimeAgo = (selector = $(".timeago")) ->
  jQuery.timeago.settings.allowFuture = true
  jQuery.timeago.settings.refreshMillis = 60000
  selector.timeago();
  selector.addClass("in")
# --------------------------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------------------------
# scrollable boxes
@setScrollable = (selector = $(".scrollable")) ->
  selector.each (i, elem) ->
    $(elem).slimScroll
      height: $(elem).data("scrollable-height")
      start: $(elem).data("scrollable-start") || "top"
# --------------------------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------------------------
# jquery-ui sortable
@setSortable = (selector = null) ->
  if selector
    selector.sortable
      axis: selector.data("sortable-axis")
      connectWith: selector.data("sortable-connect")
# --------------------------------------------------------------------------------------------------------------------

