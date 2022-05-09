import React from 'react';

const FooterComp = () => {
    return (
        <div>
            <footer class="py-3 my-4 pt-5" >
                <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                    <li class="nav-item"><a  class="nav-link px-2 text-muted">Fondespierre | BeGreen</a></li>
                    <li class="nav-item"><a  class="nav-link px-2 text-muted">Fabrique de compétences</a></li>
                    <li class="nav-item"><a target="_blank"  href='https://fondespierre.com/' class="nav-link px-2 text-muted">Liens vers notre site </a></li>
                </ul>
                <p class="text-center text-muted">© 2021 Entreprise, Tous droits réservés</p>
            </footer>
        </div>
    );
};

export default FooterComp;
