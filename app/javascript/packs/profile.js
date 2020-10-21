import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#account-show').data()
  const accountId = dataset.accountId

  axios.get(`/accounts/${accountId}/follow`)
    .then((response) => {
      const hasFollowed = response.data.hasFollowed
      if (hasFollowed) {
        $('.unfollow').removeClass('hidden')
      } else {
        $('.follow').removeClass('hidden')
      }
    })

    $('.follow').on('click', () => {
      axios.post(`/accounts/${accountId}/follow`)
        .then((response) => {
          if (response.data.status === 'ok') {
            $('.unfollow').removeClass('hidden')
            $('.follow').addClass('hidden')
            $('.profile-num2').text(`${response.data.followCount}`)
          }
        })
        .catch((e) => {
          window.alert('Error')
          console.log(e)
        })
    })

    $('.unfollow').on('click', () => {
      axios.post(`/accounts/${accountId}/unfollow`)
        .then((response) => {
          if (response.data.status === 'ok') {
            $('.follow').removeClass('hidden')
            $('.unfollow').addClass('hidden')
            $('.profile-num2').text(`${response.data.followCount}`)
          }
        })
        .catch((e) => {
          window.alert('Error')
          console.log(e)
        })
    })
})

document.addEventListener('DOMContentLoaded', () => {
  $('.slideshow').each(function () {
    var container = $('.slideshow'),
        slideGroup = container.find('.slideshow_slides_1'),
        slides = slideGroup.find('.slide'),
        nav = container.find('.slideshow_nav'),
        indicator = container.find('.slideshow_indicator_1'),

        slideCount = slideGroup.length,
        indicatorHTML = '',
        currentIndex = 0,
        duration = 500;
    
    slides.each(function (i) {
      if(i < 3) {
         $(this).css({left: 100 * i + '%'});
        indicatorHTML += '<a href = "#">' + ('▪︎') + '</a>';
      } else {
        return false;
      } 
    });

    indicator.html(indicatorHTML);

    function goToSlide (index) {
        slideGroup.animate({left: -100 * index + '%'}, duration);
        currentIndex = index;
        updateNav();
    }

    function updateNav () {
        indicator.find('a').removeClass('active').eq(currentIndex).addClass('active');
    }

    indicator.on('click', 'a', function (event) {
        event.preventDefault();
        if (!$(this).hasClass('prev')) {
            goToSlide($(this).index());
        } 
    });

    goToSlide(currentIndex);
  });
});


document.addEventListener('DOMContentLoaded', () => {
  $('.slideshow').each(function () {
    var container = $('.slideshow'),
        slideGroup = container.find('.slideshow_slides_2'),
        slides = slideGroup.find('.slide'),
        nav = container.find('.slideshow_nav'),
        indicator = container.find('.slideshow_indicator_2'),

        slideCount = slideGroup.length,
        indicatorHTML = '',
        currentIndex = 0,
        duration = 500;
    
    slides.each(function (i) {
      if(i < 3) {
         $(this).css({left: 100 * i + '%'});
        indicatorHTML += '<a href = "#">' + ('▪︎') + '</a>';
      } else {
        return false;
      } 
    });

    indicator.html(indicatorHTML);

    function goToSlide (index) {
        slideGroup.animate({left: -100 * index + '%'}, duration);
        currentIndex = index;
        updateNav();
    }

    function updateNav () {
        indicator.find('a').removeClass('active').eq(currentIndex).addClass('active');
    }

    indicator.on('click', 'a', function (event) {
        event.preventDefault();
        if (!$(this).hasClass('prev')) {
            goToSlide($(this).index());
        } 
    });

    goToSlide(currentIndex);
  });
});


document.addEventListener('DOMContentLoaded', () => {
  $('.slideshow').each(function () {
    var container = $('.slideshow'),
        slideGroup = container.find('.slideshow_slides_3'),
        slides = slideGroup.find('.slide'),
        nav = container.find('.slideshow_nav'),
        indicator = container.find('.slideshow_indicator_3'),

        slideCount = slideGroup.length,
        indicatorHTML = '',
        currentIndex = 0,
        duration = 500;
    
    slides.each(function (i) {
      if(i < 3) {
         $(this).css({left: 100 * i + '%'});
        indicatorHTML += '<a href = "#">' + ('▪︎') + '</a>';
      } else {
        return false;
      } 
    });

    indicator.html(indicatorHTML);

    function goToSlide (index) {
        slideGroup.animate({left: -100 * index + '%'}, duration);
        currentIndex = index;
        updateNav();
    }

    function updateNav () {
        indicator.find('a').removeClass('active').eq(currentIndex).addClass('active');
    }

    indicator.on('click', 'a', function (event) {
        event.preventDefault();
        if (!$(this).hasClass('prev')) {
            goToSlide($(this).index());
        } 
    });

    goToSlide(currentIndex);
  });
});