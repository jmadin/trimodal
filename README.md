# Making thumbnails

    cd master
    ls *JPG | xargs -I % convert % -thumbnail 320x ../master_tn/%

Rename

    cd ../master_tn
    perl ../../../code/rename.pl 's/.JPG/_tn.jpg/' *

Finding

    find . -name "*_F8_*" -delete

*[Top](#)*

# Pandoc

Add --toc for table of contexts

    pandoc -s -S -c github.css 201410_fieldnotes.md -o 201410_fieldnotes.html
    pandoc -s -S 201410_fieldnotes.md -o 201410_fieldnotes.html
    pandoc 201410_fieldnotes.md -o 201410_fieldnotes.pdf
    pandoc -s -S 201410_fieldnotes.md -o 201410_fieldnotes.docx

*[Top](#)*



# Production

    $ bundle exec rake db:migrate RAILS_ENV="production"
    $ rake tmp:clear
    $ bundle exec rake assets:precompile RAILS_ENV=production RAILS_GROUPS=assets
    $ rails s -e production -p 3000

