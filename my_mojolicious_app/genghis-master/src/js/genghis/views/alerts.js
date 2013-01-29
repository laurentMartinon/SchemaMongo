Genghis.Views.Alerts = Backbone.View.extend({
    el: 'aside#alerts',
    initialize: function() {
        _.bindAll(this, 'render', 'addModel');

        this.collection.bind('reset', this.render);
        this.collection.bind('add',   this.addModel);
    },
    render: function() {
        $(this.el).html('');
        return this;
    },
    addModel: function(model) {
        var view = new Genghis.Views.Alert({model: model});
        $(this.el).append(view.render().el);
    }
});
