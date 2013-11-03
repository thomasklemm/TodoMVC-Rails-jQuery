# todos
jQuery ->
  Todo.init()

  # Highlight selected filter
  Todo.filters.click ->
    Todo.filters.removeClass('selected')
    $(@).addClass('selected')

  # Edit todo title on doubleclick
  Todo.list.on 'dblclick', 'label', ->
    $(@).parents('.todo').addClass('editing')

@Todo =
  list: $('#todo-list')
  newTodo: $('#new-todo')
  activeTodos: $('#active-todos-count')
  completedTodos: $('#completed-todos-count')
  clearCompleted: $('#clear-completed')
  filters: $('#filters a')

  todo: (id) ->
    $('#todo_' + id)

  init: ->
    @render

  render: ->
    @submitFormsOnCheck()
    @updateCounts()

  replaceList: (todos) ->
    @list.html(todos)
    @render()

  create: (todo) ->
    @list.append(todo)
    @clearNewTodo()
    @render()

  update: (id, todo) ->
    @todo(id).replaceWith(todo)
    @render()

  destroy: (id) ->
    @todo(id).remove()
    @render()

  clearNewTodo: ->
    @newTodo.val('')

  # Submit todo form when checkbox is clicked
  submitFormsOnCheck: ->
    forms = $('.edit_todo')
    forms.submitOnCheck()

  updateCounts: ->
    activeTodosCount = $('.todo[data-completed=false]').length
    @updateActiveTodosCount(activeTodosCount)

    completedTodosCount = $('.todo[data-completed=true]').length
    @updateCompletedTodosCount(completedTodosCount)

  updateActiveTodosCount: (count) ->
    itemOrItems = if count == 1 then 'item' else 'items'
    message = '<b>' + count + '</b> ' + itemOrItems + ' left'
    @activeTodos.html(message)

  updateCompletedTodosCount: (count) ->
    message = '(' + count + ')'
    @completedTodos.html(message)
    if count > 0
      @clearCompleted.show()
    else
      @clearCompleted.hide()
