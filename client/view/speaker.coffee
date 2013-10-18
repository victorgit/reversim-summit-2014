Template.speaker.events

  'click .edit': ->
    @speaker.toggleEdit()

  'click .save': (event, context) ->
    name = context.find("#name").value
    bio = context.find("#bio").value
    @speaker.update('profile.editing': false, 'profile.name': name, 'profile.bio': bio)

Template.speaker.speaker = -> @speaker

Template.speaker.photo = ->
  @speaker.photoUrl(120)

Template.speaker.editMode = ->
  @speaker.me() and ((not @speaker.hasBio()) or @speaker.editing())

Template.speaker.twitterShareNotMeUrl = ->
    url = Router.fullPath('speaker', id: @speaker.id)
    shareText = "#{@speaker.name()} will be speaking at reversim conf!"
    "https://twitter.com/share?url=#{encodeURIComponent(url)}&text=#{encodeURIComponent(shareText)}&via=reversim"

Template.speaker.twitterShareMeUrl = ->
    url = Router.fullPath('speaker', id: @speaker.id)
    shareText = "I'll be speaking at reversim conf!"
    "https://twitter.com/share?url=#{encodeURIComponent(url)}&text=#{encodeURIComponent(shareText)}&via=reversim"

Template.speaker.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.speaker.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')
