$(function () {

    var locationURL = location.origin + location.pathname;

    // operations with comments
    $('.save-comment').click(function () {

        var cvId = $(this).closest('tr').find('.cv_id').text();
        var commentValue = $(this).parent().find('textarea').val();


        var commentZone = $(this).closest('.text-size-14').find('.cv-row-comment');

        $.ajax({
            url: locationURL + 'cv/update-comment/' + cvId,
            type: 'POST',
            data: {
                comment: commentValue
            },
            dataType: 'text',
            success: function (response) {
                console.log("success from send " + response);
                $.ajax({
                    url: locationURL + 'cv/get-comment/' + cvId,
                    type: 'POST',
                    dataType: 'text',
                    success: function (response) {
                        console.log("updated comment = " + response);
                        commentZone.text(response);
                    },
                    error: function (error) {
                        console.log("error from get comment: " + error);
                    }
                });
            },
            error: function (error) {
                console.log("error from update comment : " + error);
            }
        });
    });


    // get cv data by id
    $('.fio').click(function () {

        var cvId = $(this).closest('tr').find('.cv_id').text();


        $.ajax({
            url: locationURL + 'cv/get-cv/' + cvId,
            type: 'POST',
            data: '',
            contentType: "application/json",
            dataType: 'text',
            success: function (response) {
                var res = JSON.parse(response);

                var fio = res.fio;
                var birthdate = res.birthdate;
                var phone = res.phone;
                var email = res.email;
                var sellary = res.sellary;
                var experiance_years = res.experiance_years;
                var experiance_places = res.experiance_places;
                var skills = res.skills;
                var about = res.about;
                var comment = res.comment;


                $('.cv-view-fio').text(fio);
                $('.cv-view-email').text(email);
                $('.cv-view-phone').text(phone);
                $('.cv-view-sellary').text(sellary);
                $('.cv-view-birthday').text(birthdate);
                $('.cv-view-experiance-years').text(experiance_years);
                $('.cv-view-experiance-place').text(experiance_places);
                $('.cv-view-skills').text(skills);
                $('.cv-view-about').text(about);
                $('.cv-view-comment').text(comment);
            },
            error: function (error) {
                console.log("error from update comment : " + error);
            }
        });
    });


    var cvId;
    var fio;
    var email;
    var phone;
    var sellary;
    var birthdate;
    var experiance_years;
    var experiance_places;
    var skills;
    var about;
    var comment;

    var editable_fio;
    var editable_email;
    var editable_phone;
    var editable_sellary;
    var editable_birthdate;
    var editable_experiance_years;
    var editable_experiance_places;
    var editable_skills;
    var editable_about;
    var editable_comment;


    $('.edit-cv-btn').click(function () {
        cvId = $(this).closest('tr').find('.cv_id').text();
        fio = $(this).closest('tr').find('.cv-fio');
        email = $(this).closest('tr').find('.cv-email');
        phone = $(this).closest('tr').find('.cv-phone');
        sellary = $(this).closest('tr').find('.cv-sellary');
        birthdate = $(this).closest('tr').find('.cv-birthdate');
        experiance_years = $(this).closest('tr').find('.cv-experiance_years');
        experiance_places = $(this).closest('tr').find('.cv-experiance_places');
        skills = $(this).closest('tr').find('.cv-skills');
        about = $(this).closest('tr').find('.cv-about');
        comment = $(this).closest('tr').find('.cv-row-comment');


        editable_fio = $('#dataInfoEdit .cv-edit-fio .form-control');
        editable_email = $('#dataInfoEdit .cv-edit-email .form-control');
        editable_phone = $('#dataInfoEdit .cv-edit-phone .form-control');
        editable_sellary = $('#dataInfoEdit .cv-edit-sellary .form-control');
        editable_birthdate = $('#dataInfoEdit .cv-edit-birthday .form-control');
        editable_experiance_years = $('#dataInfoEdit .cv-edit-experiance-years .form-control');
        editable_experiance_places = $('#dataInfoEdit .cv-edit-experiance-place');
        editable_skills = $('#dataInfoEdit .cv-edit-skills');
        editable_about = $('#dataInfoEdit .cv-edit-about');
        editable_comment = $('#dataInfoEdit .cv-edit-comment .form-control');


        editable_fio.val(fio.text());
        editable_email.val(email.text());
        editable_phone.val(phone.text());
        editable_sellary.val(sellary.text());
        editable_birthdate.val(birthdate.text());
        editable_experiance_years.val(experiance_years.text());
        editable_experiance_places.val(experiance_places.text());
        editable_skills.val(skills.text());
        editable_about.val(about.text());
        editable_comment.val(comment.text());


    });

    $('.cv-edit-save').click(function () {

        $.ajax({
            url: locationURL + 'cv/update',
            type: 'POST',
            data: {
                cvId: cvId,
                editable_fio: editable_fio.val(),
                editable_email: editable_email.val(),
                editable_phone: editable_phone.val(),
                editable_sellary: editable_sellary.val(),
                editable_birthdate: editable_birthdate.val(),
                editable_experiance_years: editable_experiance_years.val(),
                editable_experiance_places: editable_experiance_places.val(),
                editable_skills: editable_skills.val(),
                editable_about: editable_about.val(),
                editable_comment: editable_comment.val()
            },
            success: function (response) {
                console.log("cv has been successfully updated");
                fio.text(editable_fio.val());
                email.text(editable_email.val());
                phone.text(editable_phone.val());
                sellary.text(editable_sellary.val());
                birthdate.text(editable_birthdate.val());
                experiance_years.text(editable_experiance_years.val());
                experiance_places.text(editable_experiance_places.val());
                skills.text(editable_skills.val());
                about.text(editable_about.val());
                comment.text(editable_comment.val());
            },
            error: function (error) {
                console.log("error! cv has not been updated : ");
            }
        });


    });


    // добавить резюме в закладки
    $('.bookmark-cv-add').click(function() {
        $(this).closest('tr').find('.bookmark-cv-add').hide();
        $(this).closest('tr').find('.bookmark-cv-added').show();

        var cvId = $(this).closest('tr').find('.cv_id').text();

        


        /*$.ajax({
            url: locationURL + '/cv/add-bookmark',
            type: 'POST',
            data: {
                cvId: cvId,
                state: '1'
            },
            success: function (response) {
                console.log("cv has been successfully bookmarked");
            },
            error: function (error) {
                console.log("error! cv has not been bookmarked");
            }
        });*/
    });

    // удалить резюме из закладок
    $('.bookmark-cv-added').click(function() {
        $(this).closest('tr').find('.bookmark-cv-add').show();
        $(this).closest('tr').find('.bookmark-cv-added').hide();

        var cvId = $(this).closest('tr').find('.cv_id').text();


        /*$.ajax({
            url: locationURL + '/cv/add-bookmark',
            type: 'POST',
            data: {
                cvId: cvId,
                state: '0'
            },
            success: function (response) {
                console.log("cv is not bookmarked");
            },
            error: function (error) {
                console.log("error! cv is still bookmarked");
            }
        });*/
    });


});




