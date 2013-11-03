# todos

jQuery.fn.submitOnCheck = ->
  @find('input[type=submit]').remove()
  @find('input[type=checkbox]').click ->
    $(this).parent('form').submit()
  this

jQuery ->
  $('#toggle-all-form').submitOnCheck()
  $('.edit_todo').submitOnCheck()

  $('#todo-list').on 'dblclick', 'label', ->
    $(this).hide().parent().find('input[name="todo[title]"]').show()

  Todo.updateCount()
  Todo.updateLinks()

@Todo =
  replaceList: (todos) ->
    $todos = $(todos).submitOnCheck()
    $('#todo-list').html($todos)
    @updateCount()

  create: (todo) ->
    $todo = $(todo).submitOnCheck()
    $('#todo-list').append($todo)
    @clearForm()
    @updateCount()

  update: (id, todo) ->
    $todo = $(todo).submitOnCheck()
    $('#todo_' + id).replaceWith($todo)
    @updateCount()

  destroy: (id) ->
    $('#todo_' + id).remove()
    @updateCount()

  clearForm: ->
    $('#new-todo').val('')

  updateLinks: ->
    $('#filters a').removeClass('selected')
    $('#filters [href="' + window.location.pathname + '"]').addClass('selected')

  updateCount: ->
    activeCount = $('.todo[data-completed=false]').length
    plural = if activeCount == 1 then '' else 's'
    text = '<strong>' + activeCount + '</strong> item' + plural + ' left'
    $('#todo-count').html(text)

    completedCount = $('.todo[data-completed=true]').length
    $('#completed-count').html('(' + completedCount + ')')
    if completedCount > 0
      $('#clear-completed').show()
    else
      $('#clear-completed').hide()

# this.$clearCompleted.innerHTML = this.view.clearCompletedButton(todos.completed);
