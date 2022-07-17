class TitleValidator < ActiveModel::Validator
    CLICKBAIT = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    def validate(record)
        matches = []
        unless record.title == nil
            CLICKBAIT.each do |title|
                if record.title.match?(title)
                    matches << "Match!"
                end
            end
            matches << "Match!" if record.title.match?(/Top \d+/)
        end
        if matches.size == 0
            record.errors[:title] << "Not clickbaity enough!"
        end
    end
end