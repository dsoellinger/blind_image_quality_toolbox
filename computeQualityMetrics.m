function [results] = computeQualityMetrics(image)

    % Anisotrophy Test
    [gray,rgb] = biqaa.blindimagequality(image,8,6,0,'degree');
    results.biqaa_gray = gray;
    results.biqaa_rgb = rgb;

    % BIQI Test
    results.biqi = biqi.biqi(image);

    % Bliinds2 Test
    results.bliinds = bliinds2.bliinds2_score(image);

    % IQVG Test
    addpath('/Users/dsoellinger/Documents/git/uni/Matlab Toolbox/cjlin1_svnlib/libsvm/matlab');
    results.iqvg = iqvg.IQVG(image);
    rmpath('/Users/dsoellinger/Documents/git/uni/Matlab Toolbox/cjlin1_svnlib/libsvm/matlab');

    % NIQE Test
    results.niqe = niqe.niqe(image);

    % DIVINE Test
    addpath('/Users/dsoellinger/Documents/git/uni/Matlab Toolbox/gregfreeman_libsvm/libsvm/matlab');
    results.divine = divine.divine(image);
    rmpath('/Users/dsoellinger/Documents/git/uni/Matlab Toolbox/gregfreeman_libsvm/libsvm/matlab');

    % BRISQUE Test
    % Requires libsvm 3.22. Make sure that it is installed.
    results.brisque = brisque.brisquescore(image);


end
