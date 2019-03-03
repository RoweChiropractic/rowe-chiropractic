$ ->
  $("img[src*='#right']").parent().addClass('img').addClass('right')
  $("img[src*='#left']").parent().addClass('img').addClass('left')

  $('.cms-page.your-first-visit').closest('body').addClass('your-first-visit');
  $('.cms-page.david-rowe').closest('body').addClass('david-rowe');
  $('.cms-page.about-us').closest('body').addClass('about-us');
  $('.cms-page.meet-the-doctors').closest('body').addClass('meet-the-doctors');
  $('.cms-page.specialties').closest('body').addClass('specialties');
  $('.cms-page.testimonials').closest('body').addClass('testimonials');
  $('.cms-page.contact-us').closest('body').addClass('contact-us');

