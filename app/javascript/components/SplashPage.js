import React, { useEffect, useState } from 'react';

const SplashPage = props => {
  const maxPetals = 100;
  const batchFrequency = 30000;

  useEffect(() => {
    const cherryBlossoms = document.getElementById('cherry-blossoms');

    for (let i = 0; i < maxPetals; i++) {
      setTimeout(() => {
        const petal = document.createElement('div');
        petal.classList.add('petal');
        cherryBlossoms.appendChild(petal);
        
        const startLeft = Math.random() * window.innerWidth;
        const startTop = -20;
        const endTop = window.innerHeight;

        petal.style.left = startLeft + 'px';
        petal.style.top = startTop + 'px';

        const animatePetal = () => {
          petal.style.top = parseInt(petal.style.top) + 1 + 'px';
          petal.style.left = parseInt(petal.style.left) + (Math.random() * 2 - 1) + 'px';

          if (parseInt(petal.style.left) < 0) {
            cherryBlossoms.removeChild(petal);
          } else if (parseInt(petal.style.top) < endTop) {
            requestAnimationFrame(animatePetal);
          } else {
            cherryBlossoms.removeChild(petal);
          }
        };

        requestAnimationFrame(animatePetal);
      }, Math.random() * 5000);
    }
  }, []);

  return (
    <div>
      <div id="cherry-blossoms"></div>
      <p>
        Welcome. Please, feel free to wander.
      </p>
    </div>
  )
};

export default SplashPage;