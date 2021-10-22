//
//  ViewController.swift
//  Films
//
//  Created by Francis Suarez on 21/10/21.
//

import UIKit
import Foundation

class TableViewController: UITableViewController, UISearchBarDelegate, UINavigationControllerDelegate {

    
  
  
    var resultsController = UITableViewController()
    var searchController: UISearchController?
    var pelis: [Cell]?
    var favListArray:NSMutableArray = []
    var tableViewFa: UITableView!
    
    
    
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)

        if UserDefaults.standard.object(forKey: "favList") != nil {

            favListArray = NSMutableArray.init(array: UserDefaults.standard.object(forKey: "favList") as! NSMutableArray)

        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        view.backgroundColor = .white

        
//        call functions:
        filmsData()
        
        
        //    Delegate & dataSource TableView:
                tableView.delegate = self
                tableView.dataSource = self
//                searchController?.searchBar.delegate = self
                
                tableView.register(CellStyle.self, forCellReuseIdentifier: "cellId")
                tableView.tableFooterView = UIView()
              self.tableView.separatorStyle = .singleLine
               
                
        
        
    
        //    titulo primera vista:
                let titleLabel = UILabel()
                titleLabel.text = "Movies"
                titleLabel.textColor = UIColor.white
                titleLabel.font = UIFont (name: "Futura", size: 26)
                titleLabel.textAlignment = .center
                titleLabel.clipsToBounds = true
                titleLabel.layer.cornerRadius = 4
                navigationItem.title = "Films"
                navigationItem.titleView = titleLabel
//            navigationItem.largeTitleDisplayMode = .always
                navigationItem.hidesSearchBarWhenScrolling = false
       
                 
                //color fondo navigaton bar de table viewcontroller:
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
               
                //para que se mantenga la search bar y no suba dejandolo en true:
                navigationController?.navigationBar.isTranslucent = true
        
        
        
//        right button addProfile:
        let buttonFav = UIButton(type: .system)
//        buttonFav.setImage(UIImage (named: "star"), for: .normal)
        buttonFav.setTitle("Favourites", for: .normal)
        buttonFav.tintColor = .white
        buttonFav.frame = CGRect(x: 0.0, y: 0.0, width: 5.0, height: 5.0)
        buttonFav.addTarget(self, action: #selector(goFav), for: .touchDown)

        let barButtonItem2 = UIBarButtonItem(customView: buttonFav)
        self.navigationItem.rightBarButtonItems = [barButtonItem2]
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }



    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "soundCell", for: indexPath as IndexPath) as! CellStyle
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CellStyle
        cell.link = self

        cell.labelTittle.text = NSString.localizedStringWithFormat("Sound %d", indexPath.row) as String

        if favListArray.contains(cell.labelTittle.text!) {
            

            cell.buttonStar.setTitle("-", for: .normal)
            print("unmark Favourite")
        }else{

            cell.buttonStar.setTitle("+", for: .normal)
            print("mark favourite")
        }

        cell.buttonStar.tag = indexPath.row

        cell.buttonStar.addTarget(self, action:#selector(addToFav) , for: .touchUpInside)
        
        

        return cell

    }

    @objc func addToFav(sender:UIButton) {

       
        
        let cell = self.tableView.cellForRow(at: NSIndexPath.init(row: sender.tag, section: 0) as IndexPath) as! CellStyle
        
//        let indexPath = NSIndexPath()
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CellStyle


        if favListArray.contains(cell.labelTittle.text!) {

            favListArray.remove(cell.labelTittle.text!)
            let image = #imageLiteral(resourceName: "star")
            sender.setImage(image, for: .normal)
    
      
            

        }else{

            favListArray.add(cell.labelTittle.text!)
            let image = #imageLiteral(resourceName: "starblack")
            sender.setImage(image, for: .normal)
        }

        tableView.reloadData()

        UserDefaults.standard.set(favListArray, forKey: "favList")

    }

    func filmsData(){
    
    
        let film0 = Cell(imgFilm: #imageLiteral(resourceName: "job.jpeg"), nameFilm: "Steve Jobs", durationFilm: "2h 2min", directorFilm: "Danny Boyle", categoryFilm: "Biography Drama", sinopsisFilm: "Showing the backstage of three iconic product launches and ending in 1998 with the introduction of the iMac, Steve Jobs takes us behind the scenes of the digital revolution to draw the intimate portrait of the brilliant man at its epicenter. Steve Jobs is directed by Academy Award winner Danny Boyle and written by Academy Award winner Aaron Sorkin, based on the Apple founder Walter Isaacson's biographical bestseller. Producers are Mark Gordon, Guymon Casady of Film 360, Scott Rudin and Oscar winner Christian Colson. Michael Fassbender plays Steve Jobs, the pioneering founder of Apple, with Oscar-winning actress Kate Winslet playing Joanna Hoffman, former Macintosh chief marketing officer. Steve Wozniak, Apple's co-founder, is played by Seth Rogen, and Jeff Daniels plays former Apple CEO John Sculley.")
        
        let film1 = Cell(imgFilm: #imageLiteral(resourceName: "21.jpeg"), nameFilm: "21 Black Jack", durationFilm: "2h 3min", directorFilm: "Robert Luketic", categoryFilm: "Crime Drama History", sinopsisFilm: "'21' is the fact-based story about six MIT students who were trained to become experts in card counting and subsequently took Vegas casinos for millions in winnings. Ben Campbell is a young, highly intelligent, student at M.I.T. in Boston who strives to succeed.")
        
        let film2 = Cell(imgFilm: #imageLiteral(resourceName: "avatar"), nameFilm: "Avatar", durationFilm: "2h 42min", directorFilm: "James Cameron", categoryFilm: "Action Adventure Fantasy", sinopsisFilm: "When his brother is killed in a robbery, paraplegic Marine Jake Sully decides to take his place in a mission on the distant world of Pandora. There he learns of greedy corporate figurehead Parker Selfridge's intentions of driving off the native humanoid 'Na'vi' in order to mine for the precious material scattered throughout their rich woodland. In exchange for the spinal surgery that will fix his legs, Jake gathers knowledge, of the Indigenous Race and their Culture, for the cooperating military unit spearheaded by gung-ho Colonel Quaritch, while simultaneously attempting to infiltrate the Na'vi people with the use of an 'avatar' identity.")
        
        let film3 = Cell(imgFilm: #imageLiteral(resourceName: "anillo"), nameFilm: "The Lord of The Rings", durationFilm: "2h 58min", directorFilm: "Peter Jackson", categoryFilm: "Action Adventure Drama", sinopsisFilm: "The final confrontation between the forces of good and evil fighting for control of the future of Middle-earth. Frodo and Sam reach Mordor in their quest to destroy the One Ring, while Aragorn leads the forces of good against Sauron's evil army at the stone city of Minas Tirith.")
        
        let film4 = Cell(imgFilm: #imageLiteral(resourceName: "fast"), nameFilm: "The Fast and the Furious ", durationFilm: "1h 46min", directorFilm: "uno cualquiera", categoryFilm: "Suspense", sinopsisFilm: "Los Angeles street racer Dominic Toretto falls under the suspicion of the LAPD as a string of high-speed electronics truck robberies rocks the area. Brian O'Connor, an officer of the LAPD, joins the ranks of Toretto's highly skilled racing crew undercover to convict Toretto. However, O'Connor finds himself both enamored with this new world and in love with Toretto's sister, Mia. As a rival racing crew gains strength, O'Connor must decide where his loyalty really lies")
        
        let film5 = Cell(imgFilm: #imageLiteral(resourceName: "theWolf"), nameFilm: "The Wolf of Wall Street", durationFilm: "3h", directorFilm: "Martin Scorsese", categoryFilm: "Biography Comedy Crime", sinopsisFilm: "In the early 1990s, Jordan Belfort teamed with his partner Donny Azoff and started brokerage firm Stratton Oakmont. Their company quickly grows from a staff of 20 to a staff of more than 250 and their status in the trading community and Wall Street grows exponentially. So much that companies file their initial public offerings through them. As their status grows, so do the amount of substances they abuse, and so do their lies. They draw attention like no other, throwing lavish parties for their staff when they hit the jackpot on high trades. That ultimately leads to Belfort featured on the cover of Forbes Magazine, being called 'The Wolf Of Wall St.'")
        
        let film6 = Cell(imgFilm: #imageLiteral(resourceName: "kings"), nameFilm: "The King's speech", durationFilm: "54min", directorFilm: "Fran Lebowitz", categoryFilm: "Suspense", sinopsisFilm: "ritain's Prince Albert (Colin Firth) must ascend the throne as King George VI, but he has a speech impediment. Knowing that the country needs her husband to be able to communicate effectively, Elizabeth (Helena Bonham Carter) hires Lionel Logue (Geoffrey Rush), an Australian actor and speech therapist, to help him overcome his stammer. An extraordinary friendship develops between the two men, as Logue uses unconventional means to teach the monarch how to speak with confidence.")
        
        let film7 = Cell(imgFilm: #imageLiteral(resourceName: "ocean"), nameFilm: "Ocean Eleven's", durationFilm: "1h 56min", directorFilm: "Steven Soderbergh", categoryFilm: "Crime Thriller", sinopsisFilm: "Danny Ocean wants to score the biggest heist in history. He combines an eleven member team, including Frank Catton, Rusty Ryan and Linus Caldwell. Their target? The Bellagio, the Mirage and the MGM Grand. All casinos owned by Terry Benedict. It's not going to be easy, as they plan to get in secretly and out with $150 million.")
        
        let film8 = Cell(imgFilm: #imageLiteral(resourceName: "joker"), nameFilm: "Joker", durationFilm: "2h 2min", directorFilm: "Todd Phillips", categoryFilm: "Crime Drama Thriller", sinopsisFilm: "“Joker” centers around the iconic arch-nemesis and is an original, standalone story not seen before on the big screen. The exploration of Arthur Fleck (Joaquin Phoenix), a man disregarded by society, is not only a gritty character study, but also a broader cautionary tale.")
        
        let film9 = Cell(imgFilm: #imageLiteral(resourceName: "tibet"), nameFilm: "Seven years in Tibet", durationFilm: "2h 16min", directorFilm: "Jean-Jacques Annaud", categoryFilm: "Adventure Biography Drama", sinopsisFilm: "Arthur Fleck works as a clown and is an aspiring stand-up comic. He has mental health issues, part of which involves uncontrollable laughter. Times are tough and, due to his issues and occupation, Arthur has an even worse time than most. Over time these issues bear down on him, shaping his actions, making him ultimately take on the persona he is more known as...Joker.")
       
        let film10 = Cell(imgFilm: #imageLiteral(resourceName: "impossible.jpg"), nameFilm: "The Impossible", durationFilm: "1h 54min", directorFilm: "J.A Bayona", categoryFilm: "Drama History Thriller", sinopsisFilm: "A regular family - Maria (Naomi Watts), Henry (Ewan McGregor) and their three kids - travel to Thailand to spend Christmas. They get an upgrade to a villa on the coastline. After settling in and exchanging gifts, they go to the pool, like so many other tourists. A perfect paradise vacation until a distant noise becomes a roar. There is no time to escape from the tsunami; Maria and her eldest are swept one way, Henry and the youngest another. Who will survive, and what will become of them?")
        
        let film11 = Cell(imgFilm: #imageLiteral(resourceName: "seven.jpg"), nameFilm: "Seven", durationFilm: "2h 7min", directorFilm: "David Fincher", categoryFilm: "Crime Drama Mystery", sinopsisFilm: "A film about two homicide detectives' (Morgan Freeman and Brad Pitt) desperate hunt for a serial killer who justifies his crimes as absolution for the world's ignorance of the Seven Deadly Sins. The movie takes us from the tortured remains of one victim to the next as the sociopathic 'John Doe' (Kevin Spacey) sermonizes to Detectives Somerset and Mills -- one sin at a time. The sin of Gluttony comes first and the murderer's terrible capacity is graphically demonstrated in the dark and subdued tones characteristic of film noir. The seasoned and cultured but jaded Somerset researches the Seven Deadly Sins in an effort to understand the killer's modus operandi while the bright but green and impulsive Detective Mills (Pitt) scoffs at his efforts to get inside the mind of a killer...")
        
        let film12 = Cell(imgFilm: #imageLiteral(resourceName: "forrest.jpeg"), nameFilm: "Forrest Gump", durationFilm: "2h 22min", directorFilm: "Robert Zemeckis", categoryFilm: "Drama Romance", sinopsisFilm: "Forrest Gump is a simple man with a low I.Q. but good intentions. He is running through childhood with his best and only friend Jenny. His 'mama' teaches him the ways of life and leaves him to choose his destiny. Forrest joins the army for service in Vietnam, finding new friends called Dan and Bubba, he wins medals, creates a famous shrimp fishing fleet, inspires people to jog, starts a ping-pong craze, creates the smiley, writes bumper stickers and songs, donates to people and meets the president several times. However, this is all irrelevant to Forrest who can only think of his childhood sweetheart Jenny Curran, who has messed up her life. Although in the end all he wants to prove is that anyone can love anyone.")
        
        let film13 = Cell(imgFilm: #imageLiteral(resourceName: "1917.jpeg"), nameFilm: "1917", durationFilm: "1h 59min", directorFilm: "Sam Mendes", categoryFilm: "Action Drama War", sinopsisFilm: "April 1917, the Western Front. Two British soldiers are sent to deliver an urgent message to an isolated regiment. If the message is not received in time the regiment will walk into a trap and be massacred. To get to the regiment they will need to cross through enemy territory. Time is of the essence and the journey will be fraught with danger.")
        
        let film14 = Cell(imgFilm: #imageLiteral(resourceName: "breave.jpeg"), nameFilm: "Braveheart", durationFilm: "2h 58min", directorFilm: "Mel Gibson", categoryFilm: "Biography Drama History", sinopsisFilm: "Mel Gibson's 'Braveheart' is a full-throated, red-blooded battle epic about William Wallace, the legendary Scots warrior who led his nation into battle against the English in the years around 1300. It's an ambitious film, big on simple emotions like love, patriotism and treachery, and avoids the travelogue style of so many historical swashbucklers: Its locations look green, wet, vast, muddy and rugged. Not much is known about Wallace, known as Braveheart, except that according to an old epic poem, he unified the clans of Scotland and won famous battles against the English before being captured, tortured and executed as a traitor.")
        
        let film15 = Cell(imgFilm: #imageLiteral(resourceName: "jerry.jpeg"), nameFilm: "Jerry Maguire", durationFilm: "2h 13min. seconds", directorFilm: "Cameron Crowe", categoryFilm: "Comedy Drama", sinopsisFilm: "There are a couple of moments in “Jerry Maguire” when you want to hug yourself with delight. One comes when a young woman stands up in an office where a man has just been fired because of his ethics, and says, yes, she'll follow him out of the company. The other comes when she stands in her kitchen and tells her older sister that she really, truly, loves a man with her whole heart and soul. Both of those moments involve the actress Renee Zellweger, whose lovability is one of the key elements in a movie that starts out looking cynical and quickly becomes a heart warmer.")
        
        let film16 = Cell(imgFilm: #imageLiteral(resourceName: "usual.jpeg"), nameFilm: "World War Z", durationFilm: "2h 13min", directorFilm: "Marc Forster,", categoryFilm: "Action Horror", sinopsisFilm: "I accept that film adaptations of books will be different.  They have to be and they should be.  However, it's wise to retain the core concept of the book otherwise the studio is just paying for the name and hoping they'll sucker in soon-to-be-disappointed fans of the novel.  That appears to be the case with the adaptation of Max Brooks' World War Z.  The plot of the book takes place after a zombie apocalypse and has a researcher for the UN going around the world to determine the cause.  A mock documentary style would probably work best since the novel has multiple points of view.  I can understand the need to whittle down the movie to a single POV especially when that POV is from a character played by Brad Pitt.")
        
        let film17 = Cell(imgFilm: #imageLiteral(resourceName: "smith.jpeg"), nameFilm: "Mr & Mrs Smith", durationFilm: "2h", directorFilm: "Doug Liman", categoryFilm: "Action Comedy Crime", sinopsisFilm: "There is a kind of movie that consists of watching two people together on the screen. The plot is immaterial. What matters is the 'chemistry,' a term that once referred to a science but now refers to the heat we sense, or think we sense, between two movie stars. Brad Pitt and Angelina Jolie have it, or I think they have it, in 'Mr. and Mrs. Smith,' and because they do, the movie works. If they did not, there'd be nothing to work with. The screenplay is a device to revive their marriage by placing them in mortal danger, while at the same time providing an excuse for elaborate gunfights and chase scenes. I learn from Variety that it was written by Simon Kinberg as his master's thesis at Columbia. If he had been studying chemistry instead of the cinema, he might have blown up the lab, but it wouldn't have been boring.")
        
        let film18 = Cell(imgFilm: #imageLiteral(resourceName: "mile"), nameFilm: "8 mile", durationFilm: "1h 50min", directorFilm: "Curtis Hanson", categoryFilm: "Drama Music", sinopsisFilm: "Pale, depressed, Jimmy Smith Jr. (Eminem) skulks through a life that has been so terribly unkind to him. His girlfriend has gotten pregnant and broken up with him, and although he did the right thing by her--he gave her his old car--he now faces the prospect of moving back into his mother's trailer home, with her boyfriend who hates him. Jimmy carries his clothes around in a garbage bag. He has a job as a punch press operator. We see him, early in '8 Mile,' about to do the only thing he does well and takes joy in doing. He is about to go onstage at the Shelter, a rap club that looks uncannily like a deserted building, and engage in the hip-hop version of a poetry slam. In this world, he is known as 'Rabbit.' He rehearses in a mirror in the men's room, fiercely scowling at his own reflection and practicing those hand gestures all the rappers use, their outboard fingers pointed down from jerking arms as they jab spastically like Joe Cocker.")
        
        let film19 = Cell(imgFilm: #imageLiteral(resourceName: "titanic.jpeg"), nameFilm: "Titanic", durationFilm: "3h 14min", directorFilm: "James Cameron", categoryFilm: "Drama Romance", sinopsisFilm: "Like a great iron Sphinx on the ocean floor, the Titanic faces still toward the West, interrupted forever on its only voyage. We see it in the opening shots of 'Titanic,' encrusted with the silt of 85 years; a remote-controlled TV camera snakes its way inside, down corridors and through doorways, showing us staterooms built for millionaires and inherited by crustaceans. These shots strike precisely the right note; the ship calls from its grave for its story to be told, and if the story is made of showbiz and hype, smoke and mirrors--well, so was the Titanic. She was 'the largest moving work of man in all history,' a character boasts, neatly dismissing the Pyramids and the Great Wall. There is a shot of her, early in the film, sweeping majestically beneath the camera from bow to stern, nearly 900 feet long and 'unsinkable,' it was claimed, until an iceberg made an irrefutable reply.")
     
        
        pelis = [film0, film1, film2, film3, film4, film5, film6, film7, film8, film9, film10, film11, film12, film13, film14, film15, film16, film17, film18, film19]
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100

    }
    override func numberOfSections(in tableView: UITableView) -> Int {


        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        pelis!.count

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CellStyle


        cell.imageFilm.image = pelis?[indexPath.row].imgFilm
        cell.labelTittle.text = pelis?[indexPath.row].nameFilm
        cell.labelDirector.text = pelis?[indexPath.row].directorFilm
        cell.labelCategory.text = pelis?[indexPath.row].categoryFilm

        cell.backgroundColor = UIColor.white

        return cell

}

override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){

    let selectedBook = pelis?[indexPath.row]

   tableView.deselectRow(at: indexPath, animated: true)
   let layout = UICollectionViewFlowLayout()

   let fvc = DetailViewController()

    fvc.cell = selectedBook


    self.present(fvc, animated: true, completion: nil)
}
    
    @objc func goFav (sender: UIButton){
    let storyboard: UIStoryboard = UIStoryboard(name: "Base.lproj/Main", bundle: nil)
    let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "aFav") as! FavouritesViewController
    self.present(vc, animated: false , completion: nil)
    
    
    }


}

