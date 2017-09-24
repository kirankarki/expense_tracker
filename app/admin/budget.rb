ActiveAdmin.register Budget do

    permit_params :title, :description, :original_amount, :start_date, :end_date, :user_id

    index do
        selectable_column
        id_column
        column :title
        column :original_amount
        column :start_date
        column :end_date
        column :created_at
        column :user
        actions
    end

    filter :title
    filter :start_date
    filter :end_date
    filter :created_at
    filter :user

    form do |f|
        f.inputs do
            f.input :title
            f.input :description
            f.input :start_date
            f.input :end_date
            f.input :user
        end
        f.actions
    end

end
